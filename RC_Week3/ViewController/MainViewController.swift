//
//  ViewController.swift
//  RC_Week3
//
//  Created by Jungmo Yu on 2022/02/23.
//

import UIKit
import Foundation

class MainViewController: UIViewController {
    
    weak var menuBar: UIView!
    weak var collectionView: UICollectionView!
    var mainViewData = MainImageData()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.isHidden = true
        setupMenuBar()
        setupCollectionView()
        registerCellsToCollectionView()
    }
    
    private func registerCellsToCollectionView() {
        self.collectionView.register(SearchBarCollectionViewCell.self, forCellWithReuseIdentifier: SearchBarCollectionViewCell.identifier)
        self.collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
    }
    
}


extension MainViewController {
    func makeCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            if sectionIndex == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(80))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: itemSize.heightDimension)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                       
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.bottom = 10
                return section
            } else if sectionIndex == 1 {
                
                let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5)), subitem: item, count: 2)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.contentInsets.bottom = 10
                return section
            } else if sectionIndex == 2 {
                let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100)), subitem: item, count: 1)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.contentInsets.bottom = 10
                
                return section
            } else if sectionIndex == 3{
                let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.25)), subitem: item, count: 2)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.contentInsets.bottom = 16
                
                return section
            } else if sectionIndex == 4 {
                let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.2)), subitem: item, count: 3)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.contentInsets.bottom = 10
                
                return section
            } else if sectionIndex == 5 {
                let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16 * 2
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150)), subitem: item, count: 1)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                section.contentInsets.leading = 16
                section.contentInsets.bottom = 10
                
                return section
            } else {
                let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100)), subitem: item, count: 1)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.contentInsets.bottom = 10
                
                return section
            }
        }
        return layout
    }
}


extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return mainViewData.numOfSection() + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        default:
            return mainViewData.numOfItemsInSection(section: section)
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: SearchBarCollectionViewCell.identifier, for: indexPath) as! SearchBarCollectionViewCell
            return cell
        case 1...6:
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
            cell.setupImage(image: mainViewData.imageString(atSection: indexPath.section, orderOfItem: indexPath.item))
            print(indexPath.section, indexPath.item)
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.item == 0 {
            let controller = SecondViewController()
            navigationController?.pushViewController(controller, animated: true)
        }
        
        print("clicked @MainViewController - section : \(indexPath.section), item : \(indexPath.item)")
        
    }
    
}




extension MainViewController {
    fileprivate func setupMenuBar() {
        
        let subView = MenuBar()
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(subView)
        subView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        subView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        subView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        subView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.menuBar = subView
    }
}

extension MainViewController {
    fileprivate func setupCollectionView() {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: makeCompositionalLayout())
        cv.backgroundColor = UIColor(displayP3Red: 246/255, green: 245/255, blue: 246/255, alpha: 1)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(cv)
        cv.topAnchor.constraint(equalTo: self.menuBar.bottomAnchor).isActive = true
        cv.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        cv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        cv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        
        self.collectionView = cv
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}
