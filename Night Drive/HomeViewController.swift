//
//  HomeViewController.swift
//  Night Drive
//
//  Created by Gabe Sanborn on 11/29/20.
//

import UIKit
import Parse

class HomeViewController: UIViewController {

    @IBOutlet weak var userLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        //puts username is "User" field
        let userInfo =  PFObject(className: "User")
        userInfo["username"] = PFUser.current()!
        let user = userInfo["username"] as! PFUser
        userLabel.text = user.username
        
        
        
    }
          
}
