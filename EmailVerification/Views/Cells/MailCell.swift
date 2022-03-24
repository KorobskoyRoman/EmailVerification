//
//  MailCell.swift
//  EmailVerification
//
//  Created by Roman Korobskoy on 23.03.2022.
//

import Foundation
import UIKit

class MailCell: UICollectionViewCell {
    
    private let domainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SF Pro", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.alpha = 0.5
        contentView.layer.cornerRadius = 10
        
        addSubview(domainLabel)
    }
    
    private func configure(mailLabelText: String) {
        domainLabel.text = mailLabelText
    }
    
    public func cellConfigure(mailLabelText: String) {
        configure(mailLabelText: mailLabelText)
    }
}

// MARK: - Extensions

extension MailCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            domainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            domainLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
