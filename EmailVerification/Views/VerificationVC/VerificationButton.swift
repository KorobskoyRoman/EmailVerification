//
//  VerificationButton.swift
//  EmailVerification
//
//  Created by Roman Korobskoy on 23.03.2022.
//

import Foundation
import UIKit

class VerificationButton: UIButton {
    
    public var isValid = false {
        didSet {
            if self.isValid {
                setValidSettings()
            } else {
                setNotValidSettings()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyGradients(cornerRadius: 15)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .mainWhite()
        setTitle("Verificate", for: .normal)
        setTitleColor(.mainBlack(), for: .normal)
        layer.cornerRadius = 15
        titleLabel?.font = UIFont(name: "SF Pro", size: 17)
        isEnabled = false
        alpha = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setNotValidSettings() {
        isEnabled = false
        alpha = 0.5
        applyGradients(cornerRadius: 15)
    }
    
    private func setValidSettings() {
        isEnabled = true
        alpha = 1
        applyGradients(cornerRadius: 15)
    }
    
    public func setDefaultSettings() {
        configure()
    }
}
