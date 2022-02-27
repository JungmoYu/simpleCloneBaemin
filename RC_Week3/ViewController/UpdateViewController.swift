//
//  UpdateViewController.swift
//  RC_Week3
//
//  Created by Jungmo Yu on 2022/02/27.
//

import Foundation
import UIKit
import SnapKit

class UpdateViewController: UIViewController {
    
    
    var imageView: UIImageView!
    var shopNameLabel: UILabel!
    var shopNameTextField : UITextField!
    var confirmBtn: UIButton!
    var cancelBtn: UIButton!
    var index: Int = 0
    
    var shopData: ShopData?
//    var updateVCDelegate: UpdateViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    
    func setupViews() {
        let image = UIImageView()
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-200)
            make.width.height.equalTo(120)
        }
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 10
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.lightGray.cgColor
        if let imgStr = shopData?.nameOfBrand {
            image.image = UIImage(named: imgStr)
        }
        
        
        
        let shopNameLabel = UILabel()
        view.addSubview(shopNameLabel)
        if let shopNameStr = shopData?.nameOfShop {
            shopNameLabel.text = "상호 명 : \(shopNameStr)"
        }
        shopNameLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(20)
            make.centerX.equalTo(image.snp.centerX).offset(-100)
        }
        
        let shopNameTF = UITextField()
        view.addSubview(shopNameTF)
        shopNameTF.snp.makeConstraints { make in
            make.leading.equalTo(shopNameLabel.snp.trailing).offset(20)
            make.centerY.equalTo(shopNameLabel)
            make.height.equalTo(shopNameLabel)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        shopNameTF.placeholder = "변경할 상호 명"
        shopNameTF.borderStyle = .roundedRect
        shopNameTF.layer.borderColor = UIColor.lightGray.cgColor
        shopNameTF.layer.borderWidth = 1
        
        
        
        
        
        let cancel = UIButton()
        view.addSubview(cancel)
        cancel.layer.borderWidth = 3
        cancel.layer.cornerRadius = 5
        cancel.setTitle("취소", for: .normal)
        cancel.setTitleColor(UIColor.red, for: .normal)
        cancel.snp.makeConstraints { make in
            make.trailing.equalTo(shopNameTF.snp.trailing)
            make.width.equalTo(image).multipliedBy(0.45)
            make.top.equalTo(shopNameTF.snp.bottom).offset(10)
        }
        cancel.addTarget(self, action: #selector(cancelBtnClicked(_:)), for: .touchUpInside)
        
        
        let confirm = UIButton()
        view.addSubview(confirm)
        confirm.layer.borderWidth = 3
        confirm.layer.cornerRadius = 5
        confirm.setTitle("확인", for: .normal)
        confirm.setTitleColor(UIColor.blue, for: .normal)
        confirm.addTarget(self, action: #selector(confirmBtnClicked(_:)), for: .touchUpInside)
        
        confirm.snp.makeConstraints { make in
            make.trailing.equalTo(cancel.snp.leading).offset(-5)
            make.width.equalTo(image).multipliedBy(0.45)
            make.top.equalTo(shopNameTF.snp.bottom).offset(10)
        }
        
        self.imageView = image
        self.shopNameLabel = shopNameLabel
        self.shopNameTextField = shopNameTF
        self.confirmBtn = confirm
        self.cancelBtn = cancel
    }
    
    
    
    
    @objc func cancelBtnClicked(_ sender: UIButton) {
        print("UpdateViewController - cancelBtn clicked")
        navigationController?.popViewController(animated: true)
    }
    
    @objc func confirmBtnClicked(_ sender: UIButton) {
        print("UpdateViewController - confirmBtn clicked")
        
        if let nameOfShop = self.shopNameTextField.text {
//            self.shopData?.nameOfShop = nameOfShop
//            updateVCDelegate?.passUpdatedData(self.shopData!)

            ThirdViewShopData.shared.updateShopForIndexToItem(at: self.index, newNameOfShop: nameOfShop)
        }
    
        navigationController?.popViewController(animated: true)
        
    }
    
}


//protocol UpdateViewControllerDelegate {
//    func passUpdatedData(_ data: ShopData)
//}
