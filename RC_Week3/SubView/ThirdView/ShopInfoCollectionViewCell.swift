//
//  ShopInfoCollectionViewCell.swift
//  RC_Week3
//
//  Created by Jungmo Yu on 2022/02/25.
//

import UIKit

class ShopInfoCollectionViewCell: UICollectionViewCell {

    static let idendifier: String = String(describing: ShopInfoCollectionViewCell.self)
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameOfShopLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var delayTimeLabel: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViews()
        
        
    }
    
    fileprivate func setupViews() {
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        delayTimeLabel.layer.cornerRadius = 30
    }
    
    public func setupCellData(shop: ShopData) {
        
        imageView.image = UIImage(named: shop.nameOfBrand)
        nameOfShopLabel.text = shop.nameOfShop
        descriptionLabel.text = "⭐️ \(shop.rating) (\(shop.numOfReviews)+) \(shop.description)"
        priceLabel.text = "최소주문 \(shop.minimumPrice)원, 배달팁 \(shop.deliveryCost)원"
        delayTimeLabel.text = "🕒 \(shop.delayTimeMin)~\(shop.delayTimeMax)분"
        
        deleteBtn.setImage(UIImage(systemName: "x.circle"), for: .normal)
        deleteBtn.setTitle("", for: .normal)
        deleteBtn.tintColor = .red
        
    }
    
}

