//
//  ImageCollectionViewCell.swift
//  RC_Week3
//
//  Created by Jungmo Yu on 2022/02/24.
//

import Foundation
import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = String(describing: ImageCollectionViewCell.self)
    
    var image: UIImageView!
    var imageString: String = ""
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func setupImage(image imageString: String) {
        self.imageString = imageString
        image = UIImageView(image: UIImage(named: imageString))
        contentView.addSubview(image)
        
        image.layer.cornerRadius = 15
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        image.contentMode = .scaleToFill
    }
    
    public func labelChangeAtScrollSection(section: Int) {
        lazy var isScrollSection: Bool = false
        
        
    }
    
    
}

