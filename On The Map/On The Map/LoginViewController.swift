//
//  LoginViewController.swift
//  On The Map
//
//  Created by Nicholas Busby on 4/23/15.
//  Copyright (c) 2015 Nicholas Busby. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginButtonClicked(sender: AnyObject) {
        loginButton.enabled = false
        Login().attemptToLogIn(email.text, password: password.text){ (success, error) in
            if success{
                if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate{
                    var user = appDelegate.user
                    Login().getUserInfo(user!.key){ (success, error) in
                        if success{
                            self.logInSuccessful()
                        }
                    }
                } else {
                    self.displayError(error)
                }
            } else {
                self.displayError(error)
            }
        }
    }
    
    func logInSuccessful() {
        dispatch_async(dispatch_get_main_queue(), {
            let controller = self.storyboard!.instantiateViewControllerWithIdentifier("MainAppNavigationController") as! UINavigationController
            self.presentViewController(controller, animated: true, completion: nil)
        })
    }
    
    func displayError(error: String?) {
        let alert = UIAlertView()
        alert.title = "Oops"
        alert.message = error
        alert.addButtonWithTitle("OK")
        dispatch_async(dispatch_get_main_queue(), {
            if let errorString = error {
                alert.show()
            }
        })
        loginButton.enabled = true
    }
}