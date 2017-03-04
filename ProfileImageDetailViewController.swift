//
//  ProfileImageDetailViewController.swift
//  Twitter
//
//  Created by Arthur on 2017/3/3.
//  Copyright © 2017年 Kuan-Ting Wu (Arthur Wu). All rights reserved.
//

import UIKit

class ProfileImageDetailViewController: UIViewController {

    var picURL:URL?
    @IBOutlet var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.setImageWith(picURL!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func dismiss(_ sender: Any)
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
