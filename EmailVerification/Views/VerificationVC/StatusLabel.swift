//
//  StatusLabel.swift
//  EmailVerification
//
//  Created by Roman Korobskoy on 23.03.2022.
//

import Foundation
import UIKit

class StatusLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        text = "Check your mail"
        textColor = .mainWhite()
        font = UIFont(name: "SF Pro", size: 16)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
