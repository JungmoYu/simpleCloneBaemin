//
//  CreateViewController.swift
//  RC_Week3
//
//  Created by Jungmo Yu on 2022/02/26.
//

import Foundation
import UIKit
import SnapKit


class CreateViewController: UIViewController {
    
    var brandTextField: UITextField!
    var nameOfShopTextField: UITextField!
    var ratingTextField: UITextField!
    var descriptionTextField: UITextField!
    var minPriceTextField: UITextField!
    var deliveryCostTextField: UITextField!
    var minDelayTextField: UITextField!
    var maxDelayTextField: UITextField!

    var confirmBtn: UIButton!
    var cancelBtn: UIButton!
    
    var delegate: CreateViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupTextField()
        setupConfirmBtn()
        setupCancelBtn()
    }
    
    func setupTextField() {
        let nameOfShopTF = UITextField()
        view.addSubview(nameOfShopTF)
        
        nameOfShopTF.placeholder = "추가할 치킨집 이름"
        nameOfShopTF.layer.borderColor = UIColor.lightGray.cgColor
        nameOfShopTF.layer.borderWidth = 3
        
        nameOfShopTF.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-150)
        }
        
        let brandTF = UITextField()
        view.addSubview(brandTF)
        brandTF.translatesAutoresizingMaskIntoConstraints = false
        brandTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        brandTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        brandTF.bottomAnchor.constraint(equalTo: nameOfShopTF.topAnchor, constant: -15).isActive = true
        brandTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        brandTF.placeholder = "추가할 치킨집 브랜드"
        brandTF.layer.borderColor = UIColor.lightGray.cgColor
        brandTF.layer.borderWidth = 3
        
        let ratingTF = UITextField()
        view.addSubview(ratingTF)
        ratingTF.translatesAutoresizingMaskIntoConstraints = false
        ratingTF.widthAnchor.constraint(equalTo: nameOfShopTF.widthAnchor, multiplier: 0.49).isActive = true
        ratingTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ratingTF.topAnchor.constraint(equalTo: nameOfShopTF.bottomAnchor, constant: 15).isActive = true
        ratingTF.leadingAnchor.constraint(equalTo: nameOfShopTF.leadingAnchor).isActive = true
        ratingTF.placeholder = "별점 ?(0~5)"
        ratingTF.layer.borderColor = UIColor.lightGray.cgColor
        ratingTF.layer.borderWidth = 3
        
        let descTF = UITextField()
        view.addSubview(descTF)
        descTF.translatesAutoresizingMaskIntoConstraints = false
        descTF.widthAnchor.constraint(equalTo: nameOfShopTF.widthAnchor, multiplier: 0.49).isActive = true
        descTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        descTF.topAnchor.constraint(equalTo: nameOfShopTF.bottomAnchor, constant: 15).isActive = true
        descTF.trailingAnchor.constraint(equalTo: nameOfShopTF.trailingAnchor).isActive = true
        descTF.placeholder = "한줄 평"
        descTF.layer.borderColor = UIColor.lightGray.cgColor
        descTF.layer.borderWidth = 3
        
        let minPriceTF = UITextField()
        view.addSubview(minPriceTF)
        minPriceTF.translatesAutoresizingMaskIntoConstraints = false
        minPriceTF.widthAnchor.constraint(equalTo: nameOfShopTF.widthAnchor, multiplier: 0.49).isActive = true
        minPriceTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        minPriceTF.topAnchor.constraint(equalTo: descTF.bottomAnchor, constant: 15).isActive = true
        minPriceTF.leadingAnchor.constraint(equalTo: nameOfShopTF.leadingAnchor).isActive = true
        minPriceTF.placeholder = "최소 주문 금액"
        minPriceTF.layer.borderColor = UIColor.lightGray.cgColor
        minPriceTF.layer.borderWidth = 3
        
        let delCost = UITextField()
        view.addSubview(delCost)
        delCost.translatesAutoresizingMaskIntoConstraints = false
        delCost.widthAnchor.constraint(equalTo: nameOfShopTF.widthAnchor, multiplier: 0.49).isActive = true
        delCost.heightAnchor.constraint(equalToConstant: 30).isActive = true
        delCost.topAnchor.constraint(equalTo: descTF.bottomAnchor, constant: 15).isActive = true
        delCost.trailingAnchor.constraint(equalTo: nameOfShopTF.trailingAnchor).isActive = true
        delCost.placeholder = "배달 비용"
        delCost.layer.borderColor = UIColor.lightGray.cgColor
        delCost.layer.borderWidth = 3
        
        
        let minDelayTF = UITextField()
        view.addSubview(minDelayTF)
        minDelayTF.translatesAutoresizingMaskIntoConstraints = false
        minDelayTF.widthAnchor.constraint(equalTo: nameOfShopTF.widthAnchor, multiplier: 0.49).isActive = true
        minDelayTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        minDelayTF.topAnchor.constraint(equalTo: delCost.bottomAnchor, constant: 15).isActive = true
        minDelayTF.leadingAnchor.constraint(equalTo: nameOfShopTF.leadingAnchor).isActive = true
        minDelayTF.placeholder = "배달소요시간 최소"
        minDelayTF.layer.borderColor = UIColor.lightGray.cgColor
        minDelayTF.layer.borderWidth = 3
        
        let maxDelayTF = UITextField()
        view.addSubview(maxDelayTF)
        maxDelayTF.translatesAutoresizingMaskIntoConstraints = false
        maxDelayTF.widthAnchor.constraint(equalTo: nameOfShopTF.widthAnchor, multiplier: 0.49).isActive = true
        maxDelayTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        maxDelayTF.topAnchor.constraint(equalTo: delCost.bottomAnchor, constant: 15).isActive = true
        maxDelayTF.trailingAnchor.constraint(equalTo: nameOfShopTF.trailingAnchor).isActive = true
        maxDelayTF.placeholder = "배달소요시간 최대"
        maxDelayTF.layer.borderColor = UIColor.lightGray.cgColor
        maxDelayTF.layer.borderWidth = 3
        
        self.nameOfShopTextField = nameOfShopTF
        self.brandTextField = brandTF
        self.ratingTextField = ratingTF
        self.descriptionTextField = descTF
        self.minPriceTextField = minPriceTF
        self.deliveryCostTextField = delCost
        self.minDelayTextField = minDelayTF
        self.maxDelayTextField = maxDelayTF
    }
    
    func setupConfirmBtn() {
        let btn = UIButton()
        view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.topAnchor.constraint(equalTo: self.minDelayTextField.bottomAnchor, constant: 15).isActive = true
        btn.leadingAnchor.constraint(equalTo: self.nameOfShopTextField.leadingAnchor).isActive = true
        btn.widthAnchor.constraint(equalTo: self.nameOfShopTextField.widthAnchor, multiplier: 0.49).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        btn.layer.borderWidth = 3
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor.blue.cgColor
        btn.setTitle("확인", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        
        btn.addTarget(self, action: #selector(popControllerWithData(_:)), for: .touchUpInside)
        
        confirmBtn = btn
        
    }
    
    func setupCancelBtn() {
        let btn = UIButton()
        view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.topAnchor.constraint(equalTo: self.maxDelayTextField.bottomAnchor, constant: 15).isActive = true
        btn.trailingAnchor.constraint(equalTo: self.nameOfShopTextField.trailingAnchor).isActive = true
        btn.widthAnchor.constraint(equalTo: self.nameOfShopTextField.widthAnchor, multiplier: 0.49).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        btn.layer.borderWidth = 3
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor.red.cgColor
        btn.setTitle("취소", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        
        btn.addTarget(self, action: #selector(popController(_:)), for: .touchUpInside)
        
        cancelBtn = btn
    }
    
    
    
    @objc func popController(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func popControllerWithData(_ sender: UIButton) {
        
        print("popControllerWithData called")
        
        guard let ratingText = ratingTextField.text else { return }
        guard let minPrice = minPriceTextField.text else { return }
        guard let deliCost = deliveryCostTextField.text else { return }
        guard let minDelay = minDelayTextField.text else { return }
        guard let maxDelay = maxDelayTextField.text else { return }
        guard let brandText = brandTextField.text else { return }
        guard let nameOfShopText = nameOfShopTextField.text else { return }
        guard let descText = descriptionTextField.text else { return }
        
        let brand = (brandText == "") ? "교촌치킨" : brandText
        let nameOfShop = (nameOfShopText == "") ? "나의 치킨집" : nameOfShopText
        let description = (descText == "") ? "맛있어요!!!!!!" : descText
                
        let shopData = ShopData(nameOfBrand: brand,
                                nameOfShop: nameOfShop,
                                rating: Float(ratingText) ?? 4.0,
                                numOfReviews: 100,
                                description: description,
                                minimumPrice: Int(minPrice) ?? 10000,
                                deliveryCost: Int(deliCost) ?? 3000,
                                delayTimeMin: Int(minDelay) ?? 20,
                                delayTimeMax: Int(maxDelay) ?? 60)
        
        delegate?.passData(shopData)
        navigationController?.popViewController(animated: true)
    }
}


protocol CreateViewControllerDelegate {
    func passData(_ data: ShopData)
}
