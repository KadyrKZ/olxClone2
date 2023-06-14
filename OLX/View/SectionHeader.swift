//
//  SectionHeader.swift
//  cc
//
//  Created by Қадыр Маратұлы on 14.06.2023.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    static let reuseIdentifier = "SectionHeader"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleButton: UIButton = {
        let label = UIButton()
        label.setTitle("Показать все", for: .normal)
        label.setTitleColor(.gray, for: .normal)
        
        label.frame.size.width = 100
        label.frame.size.height = 30
        label.translatesAutoresizingMaskIntoConstraints = false
        label.addTarget(self, action: #selector(click), for: .touchUpInside)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createHeader()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createHeader()
    }
    @objc func click(){
        print("Потом сделаю")
    }
    private func createHeader() {
        addSubview(titleLabel)
        addSubview(titleButton)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            titleButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
        ])
    }
}

