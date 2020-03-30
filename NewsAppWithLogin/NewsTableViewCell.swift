//
//  NewsTableViewCell.swift
//  NewsAppWithLogin
//
//  Created by RakeSanzzy Shrestha on 3/30/20.
//  Copyright © 2020 SelfProject. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var articleImage: UIImageView!
    
    @IBOutlet weak var articleTitle: UILabel!

    // MARK: Override Function
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
