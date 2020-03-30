//
//  LoginViewController.swift
//  NewsDemoApp
//
//  Created by RakeSanzzy Shrestha on 3/29/20.
//  Copyright © 2020 SelfProject. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email_textField: UITextField!
    
    @IBOutlet weak var password_textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnSignIn_tocuhUpInside(_ sender: Any) {
        
        if let email = email_textField.text, let password = password_textField.text{
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
                if (error != nil){
                    print("error signing in")
                }
                else{
                    print("login successful")
                }
              // ...
            }
            
        }
        
        
    }
}
