//
//  LoginViewController.swift
//  Twitter
//
//  Created by Arthur on 2017/2/20.
//  Copyright © 2017年 Kuan-Ting Wu (Arthur Wu). All rights reserved.
//

import UIKit
import BDBOAuth1Manager
class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onLoginButton(_ sender: Any)
    {
        let twitterClient = BDBOAuth1SessionManager(
            baseURL: NSURL(string:"https://api.twitter.com")! as URL!,
            consumerKey: "d3y2v26Vl3AF9psj1B3Veop9P",
            consumerSecret: "GMMxOKQaO6upmO3VzaLu92A9AGsiuwWT3DHnzdifreohIWMRfz")
        twitterClient?.deauthorize()
        twitterClient?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: NSURL(string: "twitterdemo://oauth") as URL!, scope: nil, success: {(requestToken: BDBOAuth1Credential?) ->
            Void in
            print("I got token")
            
            let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\((requestToken!.token)!)")!
            UIApplication.shared.openURL(url as URL)
            
            
        })
        {(error: Error?) -> Void in
            print("error: \(error!.localizedDescription)")
        }
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
