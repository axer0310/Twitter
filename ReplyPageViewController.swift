//
//  ReplyPageViewController.swift
//  Twitter
//
//  Created by Arthur on 2017/3/1.
//  Copyright © 2017年 Kuan-Ting Wu (Arthur Wu). All rights reserved.
//

import UIKit

class ReplyPageViewController: UIViewController
{
    
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var userName: UILabel!
    
    @IBOutlet var replyText: UITextField!
    
    var tweet: Tweet?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        userName.text = User._currentUser?.name!
        profilePic.setImageWith((User._currentUser?.profileURL!)!)
        replyText.text! += "@\(tweet!.userName!) "

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Reply(_ sender: Any)
    {
        if(!((replyText.text?.isEmpty)!))
        {
            
            
            TwitterClient.sharedInstance?.reply(status: replyText.text!,id: tweet!.id!)
        }
        self.dismiss(animated: true, completion: nil)

    }
    @IBAction func Back(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
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
