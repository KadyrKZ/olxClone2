//
//  CircleCell.swift
//  cc
//
//  Created by Қадыр Маратұлы on 14.06.2023.
//

import UIKit

class CircleCell: UICollectionViewCell {
    static let reuseIdentifier = "CircleCell"
    public var category = [Photo(id: 1, imageName: "Смартфон", price: "109990"),
                    Photo(id: 2, imageName: "Ноутбук", price: "109990"),
                    Photo(id: 3, imageName: "Работа", price: "109990"),
                    Photo(id: 4, imageName: "Недвижимость", price: "109990"),
                    Photo(id: 5, imageName: "Спорт", price: "109990"),
                    Photo(id: 6, imageName: "Автомобиль", price: "109990"),
                    Photo(id: 7, imageName: "Животные", price: "109990"),
                    Photo(id: 8, imageName: "Даром", price: "109990")]

    
    let circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
   
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func refresh(_ model: Photo){
        
        circleImageView.image = UIImage(named: model.imageName)
        label.text = model.imageName
    }
    
    func configure() {
 
        contentView.addSubview(circleImageView)
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            

            circleImageView.widthAnchor.constraint(equalToConstant: 100),
            circleImageView.heightAnchor.constraint(equalTo: circleImageView.widthAnchor),
            label.centerXAnchor.constraint(equalTo: circleImageView.centerXAnchor),
            label.topAnchor.constraint(equalTo: circleImageView.bottomAnchor, constant: 20)
        ])
    }
}
