//
//  MenuBar.swift
//  RC_Week3
//
//  Created by Jungmo Yu on 2022/02/23.
//

import Foundation
import UIKit

class MenuBar: UIView {
    
    var menuBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "rectangle.grid.2x2"), for: .normal)
        btn.tintColor = .white

        return btn
    }()
    
    var addrBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("경기 성남시 분당구 ...▼", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .preferredFont(forTextStyle: .headline)

        return btn
    }()
    
    var alarmBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "bell"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    var userProfileBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "face.smiling"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    var hStackView: UIStackView = {
       let hv = UIStackView()
        
        hv.translatesAutoresizingMaskIntoConstraints = false
        hv.distribution = .fillProportionally
        hv.spacing = 5
        
        return hv
    }()
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(displayP3Red: 95/255, green: 190/255, blue: 187/255, alpha: 1)
        self.addSubview(hStackView)
        
        hStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        hStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        hStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        hStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        hStackView.addArrangedSubview(menuBtn)
        hStackView.addArrangedSubview(addrBtn)
        hStackView.addArrangedSubview(alarmBtn)
        hStackView.addArrangedSubview(userProfileBtn)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
