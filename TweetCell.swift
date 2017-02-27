//
//  TweetCell.swift
//  Twitter
//
//  Created by Arthur on 2017/2/26.
//  Copyright © 2017年 Kuan-Ting Wu (Arthur Wu). All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var accountName: UILabel!
    @IBOutlet var timeStamp: UILabel!
    @IBOutlet var tweetText: UILabel!
    @IBOutlet var otherRetweeted: UILabel!
    
    @IBOutlet var retweetCount: UILabel!
    @IBOutlet var favorCount: UILabel!
    
    @IBOutlet var retweetButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
