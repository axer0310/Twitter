//
//  TweetDetailView.swift
//  Twitter
//
//  Created by Arthur on 2017/2/28.
//  Copyright © 2017年 Kuan-Ting Wu (Arthur Wu). All rights reserved.
//

import UIKit

class TweetDetailView: UIViewController
{
    static var tweet: Tweet?
    
    @IBOutlet var userName: UILabel!
    @IBOutlet var tweetText: UILabel!
    @IBOutlet var timeStamp: UILabel!
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var retweetCount: UILabel!
    @IBOutlet var favorCount: UILabel!
    @IBOutlet var retweetButton: UIButton!
    @IBOutlet var favButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        userName.text = TweetDetailView.tweet!.userName
        tweetText.text = TweetDetailView.tweet!.text
        timeStamp.text = ("\(TweetDetailView.tweet!.timestamp!)")
       profilePic.setImageWith(TweetDetailView.tweet!.profilePicUrl!)
       retweetCount.text = ("\(TweetDetailView.tweet!.retweetCount)")
       
       favorCount.text = ("\(TweetDetailView.tweet!.favoritesCount)")
        
        if(TweetDetailView.tweet!.retweet! == true)
        {
           retweetButton.setImage(UIImage(named: "retweet-icon-green.png"), for: UIControlState.normal)
        }
        else
        {
            retweetButton.setImage(UIImage(named: "retweet-icon.png"), for: UIControlState.normal)
        }
        
        
        if(TweetDetailView.tweet!.fav! == true)
        {
            favButton.setImage(UIImage(named: "favor-icon-red.png"), for: UIControlState.normal)
        }
        else
        {
            favButton.setImage(UIImage(named: "favor-icon.png"), for: UIControlState.normal)
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func retweet(_ sender: Any)
    {
        print("retweet")
        TwitterClient.sharedInstance?.retweet(id: TweetDetailView.tweet!.id!)
        
        retweetButton.setImage(UIImage(named: "retweet-icon-green.png"), for: UIControlState.normal)
        var buffer = Int(retweetCount.text!)
        TweetDetailView.tweet!.retweetCount = buffer! + 1
        retweetCount.text! = "\(TweetDetailView.tweet!.retweetCount)"
        
        TweetDetailView.tweet!.retweet = true;
    
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let cell = sender as! UIButton
        
        let descriptionView = segue.destination as! ReplyPageViewController;
        descriptionView.tweet = TweetDetailView.tweet;
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
