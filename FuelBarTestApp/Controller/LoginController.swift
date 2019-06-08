//
//  LoginController.swift
//  FuelBarTestApp
//
//  Created by Sherman Shi on 5/31/19.
//  Copyright © 2019 Sherman Shi. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    
    // MARK: - Properties
    
//    let logoImageView: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFit
//        iv.clipsToBounds = true
//        iv.image = #imageLiteral(resourceName: "barryslogo")
//        return iv
//    }()
//    
//    lazy var emailContainerView: UIView = {
//        let view = UIView()
//        return view.textContainerView(view: view, #imageLiteral(resourceName: "mail-image"), emailTextField)
//    }()
//    
//    lazy var passwordContainerView: UIView = {
//        let view = UIView()
//        return view.textContainerView(view: view, #imageLiteral(resourceName: "lock-image"), passwordTextField)
//    }()
//    
//    lazy var emailTextField: UITextField = {
//        let tf = UITextField()
//        return tf.textField(withPlaceholder: "Email", isSecureTextEntry: false)
//    }()
//    
//    lazy var passwordTextField: UITextField = {
//        let tf = UITextField()
//        return tf.textField(withPlaceholder: "Password", isSecureTextEntry: true)
//    }()
//    
//    let loginButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("LOG IN", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
//        button.setTitleColor(UIColor.dimGray(), for: .normal)
//        button.backgroundColor = .white
//        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
//        button.layer.cornerRadius = 5
//        return button
//    }()
//    
//    let dontHaveAccountButton: UIButton = {
//        let button = UIButton(type: .system)
//        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
//        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
//        button.setAttributedTitle(attributedTitle, for: .normal)
//        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
//        return button
//    }()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureViewComponents()
    }
    
    // MARK: - Selectors
    
    @objc func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        logUserIn(withEmail: email, password: password)
    }
    
    @objc func handleShowSignUp() {
        navigationController?.pushViewController(SignUpController(), animated: true)
    }
    
    // MARK: - API
    
    func logUserIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("failed to sign user in with error: ", error.localizedDescription)
                return
            }
            guard let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
            guard let controller = navController.viewControllers[0] as? HomeController else { return }
            controller.configureViewComponents()
            
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
//    // MARK: - Helper Functions
//    
//    func configureViewComponents() {
//        view.backgroundColor = UIColor.dimGray()
//        navigationController?.navigationBar.isHidden = true
//        
//        view.addSubview(logoImageView)
//        logoImageView.anchorwithConstant(top: view.topAnchor, bottom: nil, leading: nil, trailing: nil, paddingTop: 90, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0, width: 150, height: 150)
//        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        
//        view.addSubview(emailContainerView)
//        emailContainerView.anchorwithConstant(top: logoImageView.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 24, paddingBottom: 0, paddingLeading: 32, paddingTrailing: 32, width: 0, height: 50)
//        
//        view.addSubview(passwordContainerView)
//        passwordContainerView.anchorwithConstant(top: emailContainerView.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 16, paddingBottom: 0, paddingLeading: 32, paddingTrailing: 32, width: 0, height: 50)
//        
//        view.addSubview(loginButton)
//        loginButton.anchorwithConstant(top: passwordContainerView.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 24, paddingBottom: 0, paddingLeading: 32, paddingTrailing: 32, width: 0, height: 50)
//        
//        view.addSubview(dontHaveAccountButton)
//        dontHaveAccountButton.anchorwithConstant(top: nil, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingBottom: 20, paddingLeading: 32, paddingTrailing: 32, width: 0, height: 50)
//    }
}