//
//  SquareCell.swift
//  cc
//
//  Created by Қадыр Маратұлы on 14.06.2023.
//

import UIKit

class SquareCell: UICollectionViewCell {
    static let reuseIdentifier = "SquareCell"
 
    let squareImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
       
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
   
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
       
        label.font = UIFont.systemFont(ofSize: 20)
        label.backgroundColor = UIColor(red: 30, green: 31, blue: 31)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let price: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.backgroundColor = UIColor(red: 30, green: 31, blue: 31)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func configure() {
        
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
        contentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        contentView.addSubview(squareImageView)
        contentView.addSubview(label)
        contentView.addSubview(price)
        NSLayoutConstraint.activate([
        
            squareImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            squareImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            squareImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 15),

            squareImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            squareImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 0.5),
            
            label.leadingAnchor.constraint(equalTo: squareImageView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: squareImageView.trailingAnchor),
            label.topAnchor.constraint(equalTo: squareImageView.bottomAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -60),
            price.leadingAnchor.constraint(equalTo: squareImageView.leadingAnchor),
            price.trailingAnchor.constraint(equalTo: squareImageView.trailingAnchor),
            price.topAnchor.constraint(equalTo: squareImageView.bottomAnchor , constant: 43),
            price.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
