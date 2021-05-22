//
//  CircularCollectionViewCell.swift
//  Social Media Templates
//
//  Created by Julian Martinez on 5/21/21.
//

import UIKit

class CircularCollectionViewCell: UICollectionViewCell {
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
        imageView.layer.cornerRadius    = bounds.height / 2
        imageView.clipsToBounds         = true
        imageView.layer.borderWidth     = 3
        imageView.layer.borderColor     = UIColor.magenta.cgColor
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}
