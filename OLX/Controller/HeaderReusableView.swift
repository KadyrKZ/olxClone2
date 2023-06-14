//
//  HeaderReusableView.swift
//  OLX
//
//  Created by Қадыр Маратұлы on 12.06.2023.
//

import UIKit

var header = UILabel()

class HeaderReusableView: UICollectionReusableView {
    let header : UILabel={
    
        var label = UILabel()
        label.layer.borderColor = UIColor.green.cgColor
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 5
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTitle()
    }
        required init(coder: NSCoder) {
            fatalError("error 404")
        }
    func setupTitle(){
        addSubview(header)
        header.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        header.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        header.heightAnchor.constraint(equalToConstant: 50).isActive = true
        header.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
}
