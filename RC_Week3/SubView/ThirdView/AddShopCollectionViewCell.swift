//
//  AddShopCollectionViewCell.swift
//  RC_Week3
//
//  Created by Jungmo Yu on 2022/02/26.
//

import Foundation
import UIKit


class AddShopCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: AddShopCollectionViewCell.self)
    
    var addLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAddLabel() {
        addLabel = UILabel()
        contentView.addSubview(addLabel)
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        addLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        addLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        addLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        addLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        addLabel.text = "상점 추가하기"
        addLabel.font = .systemFont(ofSize: 30, weight: .bold)
        addLabel.textAlignment = .center
        addLabel.textColor = .blue
    }
}
