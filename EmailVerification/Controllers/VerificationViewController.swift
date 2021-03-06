//
//  ViewController.swift
//  EmailVerification
//
//  Created by Roman Korobskoy on 23.03.2022.
//

import UIKit

class VerificationViewController: UIViewController {

    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let statusLabel = StatusLabel()
    private let mailTextField = MailTextField()
    private let verificationButton = VerificationButton()
    private let collectionView = MailsCollectionView(frame: .zero,
                                                     collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var stackView = UIStackView(arrangedSubviews: [mailTextField,
                                                               verificationButton,
                                                               collectionView],
                                        axis: .vertical,
                                        spacing: 20)
    
    private let verificationModel = VerificationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setDelegates()
        setConstraints()
    }

    private func setupViews() {
        let blur = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffect = UIVisualEffectView(effect: blur)
        blurEffect.frame = view.bounds
        blurEffect.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(backgroundImage)
        view.addSubview(blurEffect)
        view.addSubview(statusLabel)
        view.addSubview(stackView)
        verificationButton.addTarget(self, action: #selector(verificationButtonTapped), for: .touchUpInside)
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.selectMailDelegate = self
        mailTextField.textFieldDelegate = self
    }
    
    @objc private func verificationButtonTapped() {
        guard let mail = mailTextField.text else { return }
        
        NetworkDataFetch.shared.fetchMail(mail: mail) { result, error in
            if error == nil {
                guard let result = result else {
                    return
                }
                if result.success {
                    guard let didYouMeanError = result.didYouMean else {
                        Alert.showResultAlert(controller: self, message: "Mail status: \(result.result) \n \(result.reasonDescription)")
                        return
                    }
                    Alert.showErrorAlert(controller: self, message: "Did you mean: \(didYouMeanError)?") { [weak self] in
                        guard let self = self else { return }
                        self.mailTextField.text = didYouMeanError
                    }
                }
            } else {
                guard let error = error?.localizedDescription else {
                    return
                }
                Alert.showResultAlert(controller: self, message: error)
            }
        }
    }
}

// MARK: - Extensions

// MARK: ActionsMailTextFieldProtocol

extension VerificationViewController: ActionsMailTextFieldProtocol {
    func typingText(text: String) {
        verificationModel.getFilteredMail(text: text)
        UIView.transition(with: collectionView, duration: 0.35, options: .transitionCrossDissolve) {
            self.statusLabel.isValid = text.isValid()
            self.verificationButton.isValid = text.isValid()
            self.collectionView.reloadData()
        }
    }
    
    func clearTextField() {
        UIView.transition(with: collectionView, duration: 0.35, options: .transitionCrossDissolve) {
            self.statusLabel.setDefaultSettings()
            self.verificationButton.setDefaultSettings()
            self.verificationModel.filteredMailArray = []
            self.collectionView.reloadData()
        }
    }
}

// MARK: UICollectionViewDataSource

extension VerificationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        verificationModel.filteredMailArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IdCell.idMailCell.rawValue,
                                                            for: indexPath) as? MailCell
        else { return UICollectionViewCell() }
        
        let mailLabelText = verificationModel.filteredMailArray[indexPath.row]
        cell.cellConfigure(mailLabelText: mailLabelText)
        
        return cell
    }
}

// MARK: SelectMailProtocol

extension VerificationViewController: SelectMailProtocol {
    func selectMail(indexPath: IndexPath) {
        guard let text = mailTextField.text else { return }
        verificationModel.getMailName(text: text)
        let domainMail = verificationModel.filteredMailArray[indexPath.row]
        let mailFull = verificationModel.nameMail + domainMail
        mailTextField.text = mailFull
        statusLabel.isValid = mailFull.isValid()
        verificationButton.isValid = mailFull.isValid()
        verificationModel.filteredMailArray = []
        
        UIView.transition(with: collectionView, duration: 0.35, options: .transitionCrossDissolve) {
            self.collectionView.reloadData()
        }
    }
}

// MARK: SetConstrains

extension VerificationViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            mailTextField.heightAnchor.constraint(equalToConstant: 50),
            stackView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

