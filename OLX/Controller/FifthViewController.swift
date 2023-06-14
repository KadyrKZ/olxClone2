//
//  FifthViewController.swift
//  OLX
//
//  Created by Қадыр Маратұлы on 11.06.2023.
//

import UIKit

class FifthViewController: UIViewController {

    var loginField = UITextField()
    var passwordField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 46, green: 46 , blue: 46)
        
    
    
    /*loginField = UITextField(frame: CGRect.zero)
    
    loginField.translatesAutoresizingMaskIntoConstraints = false
    loginField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    loginField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    loginField.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
    loginField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true*/
    
    
    var tabBarItem = UITabBarItem()
    let personSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
    let person = UIImage(systemName: "person", withConfiguration: personSymbolConfiguration)
    let person1 = UIImage(systemName: "person.fill", withConfiguration: personSymbolConfiguration)
    tabBarItem = UITabBarItem(title: "Профиль", image: person,selectedImage: person1)
    self.view.addSubview(loginField)
    self.tabBarItem = tabBarItem
    self.navigationItem.title = "OLX"
    view.backgroundColor = UIColor(red: 46, green: 46 , blue: 46)
    self.view.addSubview(loginField)
    
}

}
