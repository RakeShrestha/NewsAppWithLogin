//
//  MainViewController.swift
//  NewsDemoApp
//
//  Created by RakeSanzzy Shrestha on 3/29/20.
//  Copyright © 2020 SelfProject. All rights reserved.
//

import UIKit

enum PagesToShow: Int {
    
    case login, register
    
    var identifier: String {
        
        switch self {
            
        case .login:
            return "LoginVC"
            
        case .register:
            return "RegisterVC"
            
    }
    
}
    
    static func pagesToShow() -> [PagesToShow] {
        return  [.login, .register]
    }
    
}

class MainViewController:UIViewController {
    
    // MARK: Properties

    @IBOutlet weak var accountInfo: UILabel!
    
    @IBOutlet weak var buttonRegisterOrLogin: UIButton!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    // MARK: Override Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    // MARK: Custom Methods
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
   
    
    
    @objc func keyboardWillShow(notification: Notification) {

        backgroundImage.isHidden = true
        
        UIView.animate(withDuration: 0.5){

            self.view.layoutIfNeeded()

        }


    }
    
    @objc func keyboardWillHide(notification: Notification){

        backgroundImage.isHidden = false
        
        UIView.animate(withDuration: 0.5){

            self.view.layoutIfNeeded()

        }

    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    // MARK: Methods
    
    @IBAction func buttonRegisterOrLoginPressed(_ sender: Any) {
        
        if buttonRegisterOrLogin.titleLabel?.text == "Register" {
            
            buttonRegisterOrLogin.setTitle("Login", for: .normal)
            buttonRegisterOrLogin.titleLabel?.text = "Login"
            accountInfo.text = "Already have an Account?"
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newPage"), object: PagesToShow.register)
            
        }
        
        else{
            
            buttonRegisterOrLogin.setTitle("Register", for: .normal)
            buttonRegisterOrLogin.titleLabel?.text = "Register"
            accountInfo.text = "Don't have an Account?"
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newPage"), object: PagesToShow.login)
            
        }
        
    }
}
