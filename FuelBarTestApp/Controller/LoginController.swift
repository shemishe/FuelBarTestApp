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
    
    var loginView: LoginView { return self.view as! LoginView }
    var model = Model()
  
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        loginView.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        loginView.dontHaveAccountButton.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
    }
    
    override func loadView() {
        self.view = LoginView(frame: UIScreen.main.bounds)
    }
    
    // MARK: - Selectors
    
    @objc func handleLogin() {
        guard let email = loginView.emailTextField.text else { return }
        guard let password = loginView.passwordTextField.text else { return }
        
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
    
    // MARK: - Helper Functions
    
    func login() throws {
        let email = loginView.emailTextField.text!
        let password = loginView.passwordTextField.text!
        
        if email.isEmpty || password.isEmpty {
            throw Model.LoginError.incompleteForm
        }
        
        if !email.isValidEmail {
            throw Model.LoginError.invalidEmail
        }
        
        if password.count < 6 {
            throw Model.LoginError.incorrectPasswordLength 
        }
    }
}
