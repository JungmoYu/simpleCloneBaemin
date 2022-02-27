//
//  MainImageData.swift
//  RC_Week3
//
//  Created by Jungmo Yu on 2022/02/24.
//

import Foundation


class MainImageData {
    private var data: [ImageSection] = []
    
    init() {
        fetchData()
    }
    
    public func fetchData() {
        data = [
            // 원래는 서버에서 받아와야 하는 부분
            ImageSection(sectionIndex: 1,
                         imageString: [
                            "메인뷰_배달",
                            "메인뷰_배민"
                        ],
                         isScroll: false),
            
            ImageSection(sectionIndex: 2,
                         imageString: [
                            "메인뷰_포장"
                        ],
                         isScroll: false),
            
            ImageSection(sectionIndex: 3,
                         imageString: [
                            "메인뷰_B마트",
                            "메인뷰_간편식"
                        ],
                        isScroll: false),
            
            ImageSection(sectionIndex: 4,
                         imageString: [
                            "메인뷰_쇼핑라이브",
                            "메인뷰_선물하기",
                            "메인뷰_전국별미"
                        ],
                         isScroll: false),
            
            ImageSection(sectionIndex: 5, imageString: [
                            "메인뷰_광고1",
                            "메인뷰_광고2",
                            "메인뷰_광고3"
                        ],
                         isScroll: true),
            
            ImageSection(sectionIndex: 6,
                         imageString: [
                            "메인뷰_포인트쿠폰등"
                         ],
                         isScroll: false)
        ]
    }
    
    public func imageString(atSection: Int, orderOfItem: Int) -> String {
        return data[atSection - 1].imageString[orderOfItem]
    }
    
    public func numOfSection() -> Int {
        return data.count
    }
    
    public func numOfItemsInSection(section: Int) -> Int {
        return data[section - 1].imageString.count
    }
}
