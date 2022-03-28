//
//  MailTextField.swift
//  EmailVerification
//
//  Created by Roman Korobskoy on 23.03.2022.
//

import Foundation
import UIKit

protocol ActionsMailTextFieldProtocol: AnyObject {
    func typingText(text: String)
    func clearTextField()
}

class MailTextField: UITextField {
    
    weak var textFieldDelegate: ActionsMailTextFieldProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .mainWhite()
        borderStyle = .none
        layer.cornerRadius = 10
        textColor = .mainBlack()
        leftView = UIView(frame: CGRect(x: 0, y: 0,
                                        width: 15,
                                        height: self.frame.height))
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        placeholder = "Enter mail to verificate..."
        font = UIFont(name: "SF Pro", size: 20)
        tintColor = .mainGray()
        translatesAutoresizingMaskIntoConstraints = false
        autocapitalizationType = .none
    }
}

// MARK: - Extensions

extension MailTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
    }
    // исправляем неточность метода shouldChangeCharactersIn
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let rangeText = Range(range, in: text) {
            let updateText = text.replacingCharacters(in: rangeText, with: string)
            textFieldDelegate?.typingText(text: updateText)
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textFieldDelegate?.clearTextField()
        return true
    }
}
