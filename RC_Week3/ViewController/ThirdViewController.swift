//
//  ThirdViewController.swift
//  RC_Week3
//
//  Created by Jungmo Yu on 2022/02/25.
//

import Foundation
import UIKit


class ThirdViewController: UIViewController {
    
    
    var collectionView: UICollectionView!
    var updatedShopData: ShopData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        registerCellsToCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
    }
}


extension ThirdViewController {
    fileprivate func setupCollectionView() {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        
        view.addSubview(cv)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        cv.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cv.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cv.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        cv.delegate = self
        cv.dataSource = self
        
        collectionView = cv
    }
}

extension ThirdViewController {
    fileprivate func registerCellsToCollectionView() {
        collectionView.register(UINib(nibName: "ShopInfoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ShopInfoCollectionViewCell.idendifier)
        collectionView.register(AddShopCollectionViewCell.self, forCellWithReuseIdentifier: AddShopCollectionViewCell.identifier)
    }
}

extension ThirdViewController {
    fileprivate func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, env) -> NSCollectionLayoutSection in
            
//            if sectionIndex == 0 {
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                
                
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                return section
//            }
            
            
        }
        
        return layout
    }
}


extension ThirdViewController: UICollectionViewDelegate {
    
}

extension ThirdViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ThirdViewShopData.shared.numOfShops() + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == ThirdViewShopData.shared.numOfShops() {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddShopCollectionViewCell.identifier, for: indexPath) as! AddShopCollectionViewCell
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.lightGray.cgColor
            
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopInfoCollectionViewCell.idendifier, for: indexPath) as! ShopInfoCollectionViewCell
            
            cell.setupCellData(shop: ThirdViewShopData.shared.getShop(index: indexPath.item))
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.deleteBtn.tag = indexPath.item
            
            cell.deleteBtn.addTarget(self, action: #selector(deleteItem(_:)), for: .touchUpInside)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked @ThirdViewController - section : \(indexPath.section), item: \(indexPath.item)")
        
        if indexPath.item == ThirdViewShopData.shared.numOfShops() {
            let controller = CreateViewController()
            controller.delegate = self
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = UpdateViewController()
            controller.shopData = ThirdViewShopData.shared.getShop(index: indexPath.item)
            controller.index = indexPath.item
//            controller.updateVCDelegate = self
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}

extension ThirdViewController {
    @objc func deleteItem(_ sender: UIButton) {
        let itemIndex = sender.tag
        print("ThirdViewController - deleteBtn clicked at \(itemIndex)")
        ThirdViewShopData.shared.deleteShopAt(itemIndex)
        collectionView.reloadData()
    }
    
}

//extension ThirdViewController: UpdateViewControllerDelegate {
//    func passUpdatedData(_ data: ShopData) {
//        print("received updated shop data : nameOfShop changed to \(data.nameOfShop)")
//        self.updatedShopData = data
//    }
//
//
//}


extension ThirdViewController: CreateViewControllerDelegate {
    func passData(_ shopData: ShopData) {
        print("received shop data : \(shopData.nameOfBrand)")
        ThirdViewShopData.shared.addShop(shopData)
        
    }
}


