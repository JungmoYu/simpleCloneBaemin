//
//  SecondViewController.swift
//  RC_Week3
//
//  Created by Jungmo Yu on 2022/02/24.
//

import Foundation
import UIKit


class SecondViewController: UIViewController {
    var collectionView: UICollectionView!
    var secondViewData = SecondImageData()
    static let headerKindID = "headerKindID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        registerCellsToCollectionView()
        
        
    }
}


extension SecondViewController {
    fileprivate func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        collectionView.backgroundColor = .white //UIColor(displayP3Red: 246/255, green: 245/255, blue: 246/255, alpha: 1)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension SecondViewController {
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, env) -> NSCollectionLayoutSection? in
            
            if sectionIndex == 0 {
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1/5), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                
                return section
                
            } else if sectionIndex == 1{
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
//                item.contentInsets.trailing = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
//                section.contentInsets.leading = 16
                section.contentInsets.top = 10
                
                return section
                
            } else if sectionIndex == 2 {
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1.05) ), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
                
            } else {
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.75), heightDimension: .absolute(180) ), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: SecondViewController.headerKindID, alignment: .topLeading)
                ]
                
                
                return section
                
            }
            
            
        }
        
        return layout
    }
}

extension SecondViewController {
    fileprivate func registerCellsToCollectionView() {
        
        collectionView.register(LabelCollectionViewCell.self, forCellWithReuseIdentifier: LabelCollectionViewCell.identifier)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.register(Header.self, forSupplementaryViewOfKind: SecondViewController.headerKindID, withReuseIdentifier: Header.identifier)
    }
}

extension SecondViewController: UICollectionViewDelegate {
    
}

extension SecondViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return secondViewData.numOfSection() + 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
            
        } else {
            return secondViewData.numOfItemsInSection(section: section)
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCollectionViewCell.identifier, for: indexPath) as! LabelCollectionViewCell
            
            cell.setupLabel(text: "배달")
            
            return cell
            
        case 1...3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
            
            cell.setupImage(image: secondViewData.imageString(atSection: indexPath.section, orderOfItem: indexPath.item))
            print(indexPath.section, indexPath.item)
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.identifier, for: indexPath)
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("clicked @SecondViewController - section : \(indexPath.section), item: \(indexPath.item)")
        
        switch indexPath.section {
            
        case 0:
            let controller = UIViewController()
            controller.view.backgroundColor = .blue
            navigationController?.pushViewController(controller, animated: true)
            
        case 1:
            let controller = UIViewController()
            if indexPath.item == 0 {
                controller.view.backgroundColor = .red
            } else if indexPath.item == 1 {
                controller.view.backgroundColor = .green
            } else {
                controller.view.backgroundColor = .brown
            }
            
            navigationController?.pushViewController(controller, animated: true)
            
        case 2:
            let controller = ThirdViewController()
            navigationController?.pushViewController(controller, animated: true)
            
        default:
            break
        }
    }
}

class Header: UICollectionReusableView {
    
    static let identifier: String = String(describing: Header.self)
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        label.text = "오늘의 할인 ↯↯"
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.textColor = .darkGray
    
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
