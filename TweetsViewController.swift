//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Arthur on 2017/2/25.
//  Copyright © 2017年 Kuan-Ting Wu (Arthur Wu). All rights reserved.
//

import UIKit
import AFNetworking

class TweetsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var tweets: [Tweet]!
    
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(red:0.11, green:0.75, blue:0.96, alpha:1.0)
        tableView.dataSource = self
        tableView.delegate = self
        
        TwitterClient.sharedInstance?
            
            .homeTimeLine(
            
            success:
            { (tweets: [Tweet]) in
                self.tweets = tweets
                self.tableView.reloadData()
            },
            failure:
            { ( error: Error) in
                print("Error: \(error.localizedDescription)")
            }
        )
        self.tableView.reloadData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let tweets = tweets
        {
            return tweets.count
        }
        else
        {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        
        let tweet = tweets[indexPath.row]
        
        cell.userName.text = tweet.userName
        cell.tweetText.text = tweet.text
        cell.timeStamp.text = ("\(tweet.timestamp!)")
        cell.profilePic.setImageWith(tweet.profilePicUrl!)
        cell.retweetCount.text = ("\(tweet.retweetCount)")
        
        cell.favorCount.text = ("\(tweet.favoritesCount)")
        
        
        
        if(tweet.retweet! == true)
        {
            cell.retweetButton.setImage(UIImage(named: "retweet-icon-green.png"), for: UIControlState.normal)
        }
        else
        {
            cell.retweetButton.setImage(UIImage(named: "retweet-icon.png"), for: UIControlState.normal)
        }
        
        
        if(tweet.fav! == true)
        {
            cell.favButton.setImage(UIImage(named: "favor-icon-red.png"), for: UIControlState.normal)
        }
        else
        {
            cell.favButton.setImage(UIImage(named: "favor-icon.png"), for: UIControlState.normal)
        }

        
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        sleep(UInt32(1))
        TwitterClient.sharedInstance?.homeTimeLine(
            
            success:
            { (tweets: [Tweet]) in
                self.tweets = tweets
                self.tableView.reloadData()
        },
            failure:
            { ( error: Error) in
                print("Error: \(error.localizedDescription)")
        }
        )

        
            self.tableView.reloadData()
    }
    
    @IBAction func retweet(_ sender: Any)
    {
        print("retweet")
        var indexPath = tableView.indexPath(for: (sender as! UIButton).superview?.superview as! UITableViewCell)
        let tweet = tweets[(indexPath?.row)!]
        TwitterClient.sharedInstance?.retweet(id: tweet.id!)
        let cell = (sender as! UIButton).superview?.superview as! TweetCell
        sleep(UInt32(1))
        
        TwitterClient.sharedInstance?.homeTimeLine(
            
            success:
            { (tweets: [Tweet]) in
                self.tweets = tweets
                self.tableView.reloadData()
            },
            failure:
            { ( error: Error) in
                print("Error: \(error.localizedDescription)")
            }
        )
        
        
            cell.retweetButton.setImage(UIImage(named: "retweet-icon-green.png"), for: UIControlState.normal)

        tweet.retweet = true;  
        
        
        tableView.reloadData()
        
    }
    
   
    @IBAction func fav(_ sender: Any)
    {
        print("fav")
        var indexPath = tableView.indexPath(for: (sender as! UIButton).superview?.superview as! UITableViewCell)
        let tweet = tweets[(indexPath?.row)!]
        TwitterClient.sharedInstance?.favorite(id: tweet.id!)
        
        sleep(UInt32(1))
        
        TwitterClient.sharedInstance?.homeTimeLine(
            
            success:
            { (tweets: [Tweet]) in
                self.tweets = tweets
                self.tableView.reloadData()
        },
            failure:
            { ( error: Error) in
                print("Error: \(error.localizedDescription)")
        }
        )
        tweet.fav = true;
        
        self.tableView.reloadData()

    }
    
    
    @IBAction func Logout(_ sender: Any)
    {
        TwitterClient.sharedInstance?.logout()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let cell = sender as? UITableViewCell
        {
        let indexPath = tableView.indexPath(for: cell)
        let tweet = tweets![indexPath!.row]
        
        let descriptionView = segue.destination as! TweetDetailView;
        TweetDetailView.tweet = tweet;
        }
        else if let tap = sender as? UITapGestureRecognizer
        {
            let imageDetailView = segue.destination as! ProfileImageDetailViewController
          
            var indexPath = tableView.indexPath(for: (tap as! UIGestureRecognizer).view?.superview?.superview as! UITableViewCell)
            imageDetailView.picURL = tweets[(indexPath?.row)!].profilePicUrl!
            
            print(" tapped")
            //imageDetailView.picURL =
            
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
}
