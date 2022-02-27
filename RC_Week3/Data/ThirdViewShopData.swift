//
//  ThirdViewShopData.swift
//  RC_Week3
//
//  Created by Jungmo Yu on 2022/02/25.
//

import Foundation

class ThirdViewShopData {
    static let shared = ThirdViewShopData()
    
    private var shops: [ShopData] = []
    
    private var brands = ["BBQ", "가마로강정", "교촌치킨", "굽네치킨", "또래오래", "푸라닭"]
    private var ratings = [4.0, 4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 4.7, 4.8, 4.9, 5.0]
    private var reviews = [100, 200, 300, 500, 1000, 5000]
    private var description = ["맛있어요", "맛 없어요", "갓 튀긴 황금올리브가 맛있습니다", "고추바사삭이 맛있어요", "가마로강정 좋아요"]
    
    private init() {
        fetchData(numOfShop: 20)
    }
    
    public func fetchData(numOfShop: Int) {
        createShopDate(numOfShop: numOfShop)
    }
    
    
    public func createShopDate(numOfShop: Int) {
        
        for index in 0...(numOfShop - 1) {
            
            shops.append(ShopData(nameOfBrand: brands[Int.random(in: 0...brands.count-1)],
                                       nameOfShop: "치킨집 \(index + 1)",
                                       rating: Float(ratings[Int.random(in: 0...ratings.count-1)]),
                                       numOfReviews: reviews[Int.random(in: 0...reviews.count-1)],
                                       description: description[Int.random(in: 0...description.count-1)],
                                       minimumPrice: Int.random(in: 15...20) * 1000,
                                       deliveryCost: Int.random(in: 20...40) * 100,
                                       delayTimeMin: Int.random(in: 20...30),
                                       delayTimeMax: Int.random(in: 40...60)))
        }
        print("shop added - num of shop : \(numOfShops())")
    }
    
    
    public func numOfShops() -> Int {
        return shops.count
    }
    
    public func getShop(index: Int) -> ShopData {
        return shops[index]
    }
    
    
    public func addShop(_ shop: ShopData) {
        shops.append(shop)
        print("shop added - num of shop : \(numOfShops())")
    }
    
    public func deleteShopAt(_ at: Int) {
        shops.remove(at: at)
    }
    
    public func updateShopForIndexToItem(at: Int, newNameOfShop: String) {
        
        shops[at].nameOfShop = newNameOfShop
    }
    
}
