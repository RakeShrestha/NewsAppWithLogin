//
//  WebViewController.swift
//  NewsAppWithLogin
//
//  Created by RakeSanzzy Shrestha on 3/30/20.
//  Copyright © 2020 SelfProject. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    // MARK: Variables

    var url = String()
    
    // MARK: Properties
    
    @IBOutlet weak var webView: UIWebView!
    
    // MARK: Override Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadRequest(URLRequest(url: URL(string: url)!))
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
