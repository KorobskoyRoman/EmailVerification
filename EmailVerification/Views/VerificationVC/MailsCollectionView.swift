//
//  MailsCollectionView.swift
//  EmailVerification
//
//  Created by Roman Korobskoy on 23.03.2022.
//

import Foundation
import UIKit

protocol SelectMailProtocol: AnyObject {
    func selectMail(indexPath: IndexPath)
}

enum IdCell: String {
    case idMailCell
}

class MailsCollectionView: UICollectionView {
    
    weak var selectMailDelegate: SelectMailProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        configure()
        register(MailCell.self,
                 forCellWithReuseIdentifier: IdCell.idMailCell.rawValue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .none
        delegate = self
    }
}

// MARK: - Extensions

extension MailsCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectMailDelegate?.selectMail(indexPath: indexPath)
    }
}

extension MailsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 5,
               height: 40)
    }
}
