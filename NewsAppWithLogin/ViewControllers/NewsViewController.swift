//
//  NewsViewController.swift
//  NewsAppWithLogin
//
//  Created by RakeSanzzy Shrestha on 3/30/20.
//  Copyright © 2020 SelfProject. All rights reserved.
//

import UIKit
import Firebase

class NewsViewController: UIViewController {
    
    // MARK: Override Function

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Methods
    
    @IBAction func btnLogOut_touchUpInside(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            print("Successful Signout")
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newPage"), object: PagesToShow.login)
                NotificationCenter.default.post(name: UIResponder.keyboardWillHideNotification, object: nil)
            }
        } catch {
            print("Error signing out")
        }
    }

}
