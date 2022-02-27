//
//  SecondViewImageData.swift
//  RC_Week3
//
//  Created by Jungmo Yu on 2022/02/24.
//

import Foundation

class SecondImageData {
    private var data: [ImageSection] = []
    
    init() {
        fetchData()
    }
    
    public func fetchData() {
        data = [
            ImageSection(sectionIndex: 1,
                         imageString: [
                            "배달뷰_광고1",
                            "배달뷰_광고2",
                            "배달뷰_광고3"
                        ],
                         isScroll: true),
            
            ImageSection(sectionIndex: 2,
                         imageString: [
                            "버튼들모음"
                         ],
                         isScroll: false),

            ImageSection(sectionIndex: 3,
                         imageString: [
                            "배달뷰_오늘의할인1",
                            "배달뷰_오늘의할인2",
                            "배달뷰_오늘의할인3",
                            "배달뷰_오늘의할인4",
                            "배달뷰_오늘의할인5"
                         ],
                         isScroll: true)
        ]
    }
    
    public func imageString(atSection: Int, orderOfItem: Int) -> String {
        return data[atSection - 1].imageString[orderOfItem]
    }
    
    public func numOfSection() -> Int {
        return data.count
    }
    
    public func numOfItemsInSection(section: Int) -> Int {
        print(section)
        return data[section - 1].imageString.count
    }
}
