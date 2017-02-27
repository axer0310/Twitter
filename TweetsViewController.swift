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
        
        tableView.dataSource = self
        tableView.delegate = self
        
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
        cell.timeStamp.text! = ("\(tweet.timestamp)")
        cell.profilePic.setImageWith(tweet.profilePicUrl!)
        cell.retweetCount.text = ("\(tweet.retweetCount)")
        
        cell.favorCount.text = ("\(tweet.favoritesCount)")
        
        return cell
    }
    
    
    @IBAction func retweet(_ sender: Any)
    {
        print("retweet")
        var indexPath = tableView.indexPath(for: (sender as! UIButton).superview?.superview as! UITableViewCell)
        let tweet = tweets[(indexPath?.row)!]
        TwitterClient.sharedInstance?.retweet(id: tweet.id!)
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

        
        tableView.reloadData()
        
    }
    
    
    
    @IBAction func Logout(_ sender: Any)
    {
        TwitterClient.sharedInstance?.logout()
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
