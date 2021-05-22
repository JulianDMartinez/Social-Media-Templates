//
//  RoundCornerCollectionViewCell.swift
//  Social Media Templates
//
//  Created by Julian Martinez on 5/21/21.
//

import UIKit

class RoundCornerCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override func didMoveToSuperview() {
        configureImageView()
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    func configureImageView() {
        addSubview(imageView)
        
        imageView.contentMode           = .scaleAspectFill
        imageView.layer.cornerRadius    = 20
        imageView.clipsToBounds         = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}
