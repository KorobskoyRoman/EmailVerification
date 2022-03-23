//
//  VerificationButton.swift
//  EmailVerification
//
//  Created by Roman Korobskoy on 23.03.2022.
//

import Foundation
import UIKit

class VerificationButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .mainWhite()
        setTitle("Verificate", for: .normal)
        setTitleColor(.mainBlack(), for: .normal)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont(name: "SF Pro", size: 17)
        isEnabled = false
        alpha = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
}
