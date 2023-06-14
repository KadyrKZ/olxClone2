//
//  SecondViewController.swift
//  OLX
//
//  Created by Қадыр Маратұлы on 11.06.2023.
//

import UIKit

class SecondViewController: UIViewController {

    
    
   /* private enum Section {
        case stories
        case posts
        
        var numberOfItems: Int{
            switch self {
            case .posts:
                return 9
            case .stories:
                return 10
            }
        }
    }
    
    private lazy var layout: UICollectionViewLayout = {
        UICollectionViewCompositionalLayout { (section, environment) -> NSCollectionLayoutSection? in
            return nil
        }
            
        }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: self.layout
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: "StoryCellID")
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: "DefaultCellID")
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }()
    
    private let viewModel: [Section] = [
        .stories,
        .posts]
    
   */ override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //self.setupView()
        createTabbarItem()
        view.backgroundColor = UIColor(red: 46, green: 46 , blue: 46)
    }
    fileprivate func createTabbarItem() {
        var tabBarItem = UITabBarItem()
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        
        let heartIcon = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
        let heartIcon1 = UIImage(systemName: "heart.fill", withConfiguration: symbolConfiguration)
        
        tabBarItem = UITabBarItem(title: "Избранное", image: heartIcon, selectedImage: heartIcon1)

        
        self.tabBarItem = tabBarItem
        self.navigationItem.title = "SecondVC"
    }

/*
    private func setupView(){
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    
}

extension SecondViewController: UICollectionViewDelegate {
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.count
    }
}
extension SecondViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.viewModel.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel[section].numberOfItems
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = self.viewModel[indexPath.section]
        
        switch sectionType {
        case .stories:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as? StoryCell else {
                return collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            }
            cell.setup(hasBeenWatched: self.warchedCellIndexes.contains(indexPath))
            return cell
        case .posts:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCellID", for: indexPath)
            cell.backgroundColor = .red
            return cell
        }
    }*/
}

