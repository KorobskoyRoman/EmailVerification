//
//  UIView + Extension.swift
//  EmailVerification
//
//  Created by Roman Korobskoy on 23.03.2022.
//

import UIKit

extension UIView {
    
    func applyGradients(cornerRadius: CGFloat) {
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientView = GradientView(from: .trailing, to: .leading, startColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), endColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        if let gradientLayer = gradientView.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = self.bounds
            gradientLayer.cornerRadius = cornerRadius
            
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}
