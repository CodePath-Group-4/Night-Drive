//
//  SignUpViewController.swift
//  Night Drive
//
//  Created by Gabe Sanborn on 11/29/20.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var sUsernameField: UITextField!
    @IBOutlet weak var sPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignUp(_ sender: Any) {
        
        let user = PFUser()
        
        user.email = emailField.text!
        user.username = sUsernameField.text!
        user.password = sPasswordField.text!
        
        user.signUpInBackground { (success, error) in
            if success{
                self.performSegue(withIdentifier: "signUpCompleteSegue", sender: nil)
            }
            else{
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func SignIn(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpCompleteSegue", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
