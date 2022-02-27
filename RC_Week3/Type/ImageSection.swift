//
//  ImageSection.swift
//  RC_Week3
//
//  Created by Jungmo Yu on 2022/02/24.
//

import Foundation

struct ImageSection {
    var sectionIndex: Int
    var imageString: [String]
    var isScroll: Bool
    
    public func numOfItems() -> Int {
        return imageString.count
    }
}
