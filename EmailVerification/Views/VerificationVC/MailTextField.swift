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
    }
}

// MARK: - Extensions

extension MailTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        textFieldDelegate?.typingText(text: text)
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textFieldDelegate?.clearTextField()
        return true
    }
}
