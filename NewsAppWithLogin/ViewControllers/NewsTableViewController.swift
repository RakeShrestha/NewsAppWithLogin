//
//  NewsTableViewController.swift
//  NewsAppWithLogin
//
//  Created by RakeSanzzy Shrestha on 3/30/20.
//  Copyright © 2020 SelfProject. All rights reserved.
//

import UIKit
import Kingfisher

class NewsTableViewController: UITableViewController {
    
    // MARK: Variables
    
    var newsArticles : News?
    let placeHolderImage = UIImage(named: "placeholder")
    var articleImageView : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNewsArticles()
    }
    
    func getNewsArticles(){
        APIService.getNewsArticles(){
            
            (response, error) in
            if let error = error{
                print(error.errorDescription as Any)
            }else if let response = response{
                self.newsArticles = response
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: Override Function
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let articleCount = newsArticles?.articles?.count{
            
            if articleCount > 10{
                return 10
            }
            else{
                return articleCount
            }
        }
            
        else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = newsArticles?.articles?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        
        cell.articleImage.layer.masksToBounds = true
        cell.articleImage.layer.cornerRadius = 6
        
        cell.articleTitle.text = article?.title
        
        let imageUrl = URL(string: (article?.urlToImage ?? ""))
        cell.articleImage.kf.indicatorType = .activity
        cell.articleImage.kf.setImage(with: imageUrl, placeholder: placeHolderImage, options: [.transition(.fade(0.2))])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let article = newsArticles?.articles?[indexPath.row] else {return}
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController else {
            return
        }
        
        
        vc.url = article.url!
        
        vc.modalPresentationStyle = .automatic
        
        DispatchQueue.main.async {
            self.present(vc, animated:  true, completion: nil)
        }
        
    }
}
