//
//  HomeView.swift
//  FuelBarTestApp
//
//  Created by Sherman Shi on 6/8/19.
//  Copyright © 2019 Sherman Shi. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - Properties
    
    let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "barryslogo")
        iv.contentMode = UIView.ContentMode.scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.cornerRadius = 120 / 2
        return iv
    }()
    
    let signOutButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "logout-image").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "support-image").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text          = "Placeholder text"
        label.textAlignment = .center
        label.font          = UIFont.systemFont(ofSize: 24)
        label.textColor     = .white
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text          = "placeholder@gmail.com"
        label.textAlignment = .center
        label.font          = UIFont.systemFont(ofSize: 16)
        label.textColor     = .white
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Functions
    
    func configureViewComponents() {
        self.backgroundColor = UIColor.dimGray()
        
        self.addSubview(containerView)
        containerView.anchorwithConstant(top: self.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0, width: 0, height: 300)
        
        containerView.addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        profileImageView.anchorwithConstant(top: self.topAnchor, bottom: nil, leading: nil, trailing: nil, paddingTop: 120, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0, width: 120, height: 120)
        
        containerView.addSubview(signOutButton)
        signOutButton.anchorwithConstant(top: self.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: nil, paddingTop: 64, paddingBottom: 0, paddingLeading: 32, paddingTrailing: 0, width: 32, height: 32)
        
        containerView.addSubview(settingButton)
        settingButton.anchorwithConstant(top: self.topAnchor, bottom: nil, leading: nil, trailing: self.trailingAnchor, paddingTop: 64, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 32, width: 32, height: 32)
        
        containerView.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.anchorwithConstant(top: profileImageView.bottomAnchor, bottom: nil, leading: nil, trailing: nil, paddingTop: 12, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0, width: 0, height: 0)
        
        containerView.addSubview(emailLabel)
        emailLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emailLabel.anchorwithConstant(top: nameLabel.bottomAnchor, bottom: nil, leading: nil, trailing: nil, paddingTop: 4, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0, width: 0, height: 0)
        
        
    }
    
}
