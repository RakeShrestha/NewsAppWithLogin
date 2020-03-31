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
    
    // MARK: Properties
    
    @IBOutlet weak var email_textField: UITextField!
    
    @IBOutlet weak var password_textField: UITextField!
    
    // MARK: Override Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: Methods
    
    @IBAction func btnSignIn_tocuhUpInside(_ sender: Any) {
        
        // Try signing in user using firebase credentials
        
        if let email = email_textField.text, let password = password_textField.text{
            
            if email == "" || password == ""{
                let alert = UIAlertController(title: "Alert!", message: "Email or Password Text Field Empty", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                  guard let strongSelf = self else { return }
                    if (error != nil){
                        print("error signing in")
                    }
                    else{
                        print("login successful")
                        guard let vc = self?.storyboard?.instantiateViewController(withIdentifier: "NewsViewController") as? NewsViewController else {
                            return
                        }

                        
                        vc.modalPresentationStyle = .fullScreen

                        DispatchQueue.main.async {
                            self?.email_textField.text = ""
                            self?.password_textField.text = ""
                            self?.present(vc, animated:  true, completion: nil)
                        }
                    }
                  // ...
                }
            }
            
        }
        
        
    }
}
