//
//  ViewController.swift
//  OLX
//
//  Created by Қадыр Маратұлы on 11.06.2023.
//

import UIKit

class ViewController: UIViewController, UITabBarControllerDelegate {

    //MARK: -  All property
    let searchController = UISearchController(searchResultsController: nil)
    let source: [Photo] = Source.rundomPhoto(with: 30)
    private var count = 0
    
    private let collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor(red: 41, green: 42 , blue: 42)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CircleCell.self, forCellWithReuseIdentifier: CircleCell.reuseIdentifier)
        collectionView.register(SquareCell.self, forCellWithReuseIdentifier: SquareCell.reuseIdentifier)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseIdentifier)
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearchController()
        self.createLogo()
        self.setupCollectionView()
      
            }
    //MARK: - Setup CollectionView
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    //MARK: - Create searchController
        
        private func setupSearchController(){
            self.searchController.searchResultsUpdater = self
            self.searchController.obscuresBackgroundDuringPresentation = false
            self.searchController.hidesNavigationBarDuringPresentation = false
            self.searchController.searchBar.searchTextField.backgroundColor =  UIColor(red: 10, green: 13, blue: 13)
          
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            self.searchController.searchBar.tintColor = .white
            self.searchController.searchBar.searchTextField.leftView?.tintColor = UIColor(red: 160, green: 160, blue: 150)
            let placeholder = [NSAttributedString.Key.foregroundColor: UIColor(red: 160, green: 160, blue: 150)]
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Что ищете?", attributes: placeholder)
            
            self.navigationItem.searchController = searchController
            self.definesPresentationContext = false
            
        }
        
    //MARK: - Create logo for tabbar
        fileprivate func createLogo() {
            var tabBarItem = UITabBarItem()
            
           
            let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
            let houseIcon = UIImage(systemName: "house", withConfiguration: symbolConfiguration)
            let houseIcon1 = UIImage(systemName: "house.fill", withConfiguration: symbolConfiguration)

            tabBarItem = UITabBarItem(title: "Профиль", image: houseIcon, selectedImage: houseIcon1)
            self.tabBarItem = tabBarItem
            self.tabBarController?.delegate = self
            self.view.backgroundColor = UIColor(red: 31, green: 35 , blue: 41)
            self.tabBarController?.tabBar.tintColor = UIColor.white
            self.tabBarController?.tabBar.unselectedItemTintColor = .white
            tabBarController?.tabBar.backgroundColor = .black

        }

    //MARK: - Create line but does not use now
    func createLine(){
        let line = UIView()
        collectionView.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.widthAnchor.constraint(equalToConstant: view.bounds.width - 35).isActive = true
        line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        line.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 70).isActive = true
        line.backgroundColor = .gray
    }

}


//MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 8 : source.count // in category 8 cells, recommendation 
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCell.reuseIdentifier, for: indexPath) as? CircleCell
            else {
                return UICollectionViewCell()
            }
            let item = cell.category[indexPath.row]
            cell.refresh(item)
            cell.configure()

            return cell
            
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SquareCell.reuseIdentifier, for: indexPath) as? SquareCell
            else {
                return UICollectionViewCell()
            }
            cell.squareImageView.image = UIImage(named: source[indexPath.item].imageName)
    
            cell.label.layer.cornerRadius = 10
            cell.label.text = source[indexPath.row].imageName
            cell.price.text = source[indexPath.row].price
            cell.configure()
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifier, for: indexPath) as! SectionHeader
            if indexPath.section == 0 {
                header.titleLabel.text = "Категории"
                header.titleButton.isHidden = false
            } else {
                header.titleLabel.text = "Рекомендованное вам"
                header.titleButton.isHidden = true
            }
            return header
        }
        return UICollectionReusableView()
    }
}

extension ViewController {
    static func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            if sectionIndex == 0 {
                return createHorizontalSection()
            } else {
                return createVerticalSection()
            }
        }
        return layout
    }
    
    static func createHorizontalSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 18, leading: 16, bottom: 8, trailing: 16)
        section.orthogonalScrollingBehavior = .continuous
        
    
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        
        return section
    }
    
    static func createVerticalSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.30))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}

extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchText: String = searchController.searchBar.text ?? "nil"
        print("Debug print:", searchText )
    }
    
}

extension UIColor {
  convenience init(red: Int, green: Int, blue: Int) {
    let newRed = CGFloat(red)/255
    let newGreen = CGFloat(green)/255
    let newBlue = CGFloat(blue)/255

    self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)


    }
}

