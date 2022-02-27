//
//  LabelCollectionViewCell.swift
//  RC_Week3
//
//  Created by Jungmo Yu on 2022/02/24.
//

import Foundation
import UIKit



class LabelCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: LabelCollectionViewCell.self)
    
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupLabel(text: String) {
        label = UILabel()
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        label.text = "Hello World!"
        label.textColor = .gray
        
    }
}



