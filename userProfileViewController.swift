//
//  userProfileViewController.swift
//  Twitter
//
//  Created by Arthur on 2017/3/3.
//  Copyright © 2017年 Kuan-Ting Wu (Arthur Wu). All rights reserved.
//

import UIKit

class userProfileViewController: UIViewController {
    
    @IBOutlet var header: UIImageView!
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var userName: UILabel!
    
    @IBOutlet var tweetsCount: UILabel!
    
    @IBOutlet var followingCount: UILabel!
    
    @IBOutlet var followerCount: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        userName.text! = (User._currentUser?.name!)!
        profilePic.setImageWith((User._currentUser?.profileURL!)!)
        header.setImageWith((User._currentUser?.headerURL!)!)
        
        tweetsCount.text! = "\(User._currentUser!.tweetsCount!)"
        followingCount.text! = "\(User._currentUser!.followingCount!)"
        followerCount.text! = "\(User._currentUser!.followerCount!)"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
