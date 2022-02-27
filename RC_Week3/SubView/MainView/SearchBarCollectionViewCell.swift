//
//  SearchBarCollectionViewCell.swift
//  RC_Week3
//
//  Created by Jungmo Yu on 2022/02/23.
//

import Foundation
import UIKit


class SearchBarCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: SearchBarCollectionViewCell.self)
    
    var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.placeholder = "마라샹궈 나와라 뚝딱!!"
        
        return sb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = UIColor(displayP3Red: 95/255, green: 190/255, blue: 187/255, alpha: 1)
        self.contentView.addSubview(searchBar)
        self.contentView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.contentView.layer.cornerRadius = 15
        searchBar.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
