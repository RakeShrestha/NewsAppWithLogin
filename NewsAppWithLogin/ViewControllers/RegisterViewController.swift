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
    
    // MARK: Properties
    
    @IBOutlet weak var dropDownButtonOutlet: UIButton!
    
    @IBOutlet weak var registerMail: UILabel!
    
    @IBOutlet weak var email_textField: UITextField!
    
    @IBOutlet weak var password_textField: UITextField!
    
    @IBOutlet weak var name_textField: UITextField!
    
    @IBOutlet weak var mobileNumber_textField: UITextField!
    
    // MARK: Override Function
    
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
        
    }
    
    // MARK: Methods
    
    @IBAction func btnSignUp_touchUpInside(_ sender: Any) {
        
        if let email = email_textField.text, let password = password_textField.text{
            Auth.auth().createUser(withEmail: email + self.registerMail.text!, password: password) { authResult, error in
                
                if error != nil{
                    print("error signing in")
                }
                    
                else{
                    print("successfully signed in")
                    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewsViewController") as? NewsViewController else {
                        return
                    }
                    
                    
                    vc.modalPresentationStyle = .fullScreen
                    
                    DispatchQueue.main.async {
                        self.email_textField.text = ""
                        self.password_textField.text = ""
                        self.mobileNumber_textField.text = ""
                        self.name_textField.text = ""
                        Auth.auth().signIn(withEmail: email + self.registerMail.text!, password: password) { [weak self] authResult, error in
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
                        }
                    }
                }
            }
        }
    }
}
