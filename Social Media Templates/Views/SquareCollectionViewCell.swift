//
//  SquareCollectionViewCell.swift
//  Social Media Templates
//
//  Created by Julian Martinez on 5/21/21.
//

import UIKit

class SquareCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override func didMoveToSuperview() {
        configureImageView()
    }
    
    func configureImageView() {
        addSubview(imageView)
        
        imageView.contentMode           = .scaleAspectFill
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
