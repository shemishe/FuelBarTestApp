//
//  SignUpController.swift
//  FuelBarTestApp
//
//  Created by Sherman Shi on 5/31/19.
//  Copyright © 2019 Sherman Shi. All rights reserved.
//

import UIKit
import Firebase

class SignUpController: UIViewController {
    
    // MARK: - Properties
    
    var signUpView: SignUpView { return self.view as! SignUpView }
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        signUpView.signupButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        signUpView.alreadyHaveAccountButton.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
    }
    
    override func loadView() {
        self.view = SignUpView(frame: UIScreen.main.bounds)
    }
    
    // MARK: - Selectors
    
    @objc func handleSignUp() {
        guard let email = signUpView.emailTextField.text else { return }
        guard let password = signUpView.passwordTextField.text else { return }
        guard let username = signUpView.usernameTextField.text else { return }
        
        createUser(withEmail: email, password: password, username: username)
    }
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - API
    
    func createUser(withEmail email: String, password: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("failed to sign user up with error: ", error.localizedDescription)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let values = ["email": email, "username": username]
            
            Database.database().reference().child("Users").child(uid).updateChildValues(values, withCompletionBlock: { (error, ref) in
                if let error = error {
                    print("failed to update database values with error: ", error.localizedDescription)
                    return
                }
                guard let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
                guard let controller = navController.viewControllers[0] as? HomeController else { return }
                controller.configureViewComponents()
                self.dismiss(animated: true, completion: nil)
            })
        }
    }    
}
