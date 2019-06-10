//
//  SignUpView.swift
//  FuelBarTestApp
//
//  Created by Sherman Shi on 6/8/19.
//  Copyright © 2019 Sherman Shi. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    
    // MARK: - Properties
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "barryslogo")
        return iv
    }()
    
    lazy var emailContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "mail-image"), emailTextField)
    }()
    
    lazy var usernameContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "user-image"), usernameTextField)
    }()
    
    lazy var passwordContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "lock-image"), passwordTextField)
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    lazy var usernameTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Username", isSecureTextEntry: false)
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
    
    let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SIGN UP", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor.dimGray(), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return button
    }()
    
    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
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
        
        self.addSubview(logoImageView)
        logoImageView.anchorwithConstant(top: self.topAnchor, bottom: nil, leading: nil, trailing: nil, paddingTop: 90, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0, width: 150, height: 150)
        logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.addSubview(emailContainerView)
        emailContainerView.anchorwithConstant(top: logoImageView.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 24, paddingBottom: 0, paddingLeading: 32, paddingTrailing: 32, width: 0, height: 50)
        
        self.addSubview(usernameContainerView)
        usernameContainerView.anchorwithConstant(top: emailContainerView.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 16, paddingBottom: 0, paddingLeading: 32, paddingTrailing: 32, width: 0, height: 50)
        
        self.addSubview(passwordContainerView)
        passwordContainerView.anchorwithConstant(top: usernameTextField.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 16, paddingBottom: 0, paddingLeading: 32, paddingTrailing: 32, width: 0, height: 50)
        
        self.addSubview(signupButton)
        signupButton.anchorwithConstant(top: passwordContainerView.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 24, paddingBottom: 0, paddingLeading: 32, paddingTrailing: 32, width: 0, height: 50)
        
        self.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchorwithConstant(top: nil, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, paddingTop: 0, paddingBottom: 20, paddingLeading: 32, paddingTrailing: 32, width: 0, height: 50)
    }
    
    
}
