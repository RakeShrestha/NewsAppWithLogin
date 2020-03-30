//
//  RegisterViewController.swift
//  NewsDemoApp
//
//  Created by RakeSanzzy Shrestha on 3/29/20.
//  Copyright © 2020 SelfProject. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var dropDownButtonOutlet: UIButton!
    
    @IBOutlet weak var registerMail: UILabel!
    
    @IBOutlet weak var email_textField: UITextField!
    
    @IBOutlet weak var password_textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dropdownOptions = [
            
            DropdownView.Option(title: "@gmail.com",   action: { self.registerMail.text = "@gmail.com"   }),
            
            DropdownView.Option(title: "@yahoo.com",  action: { self.registerMail.text = "@yahoo.com"  }),
            
            DropdownView.Option(title: "@hotmail.com", action: { self.registerMail.text = "@hotmail.com" })
            
        ]
        
        let dropdown1: DropdownView = {
            let dropdown = DropdownView(options: dropdownOptions, target: self)
            dropdown.tintColor = .lightGray
            return dropdown
        }()
        dropdown1.attachTo(dropDownButtonOutlet, openDirection: .leftDown)
        
        
        //        dropdown2.attachTo(dropDownButtonOutlet, openDirection: .leftCenter)
        
    }
    
    @IBAction func btnSignUp_touchUpInside(_ sender: Any) {
        
        if let email = email_textField.text, let password = password_textField.text{
            Auth.auth().createUser(withEmail: email + self.registerMail.text!, password: password) { authResult, error in
              
                if error != nil{
                    print(error)
                }
                
                else{
                    print("successfully signed in")
                }
                
            }
        }
    }
    
    
}
