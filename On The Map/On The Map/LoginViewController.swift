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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginButtonClicked(sender: AnyObject) {
        var loginSucceded = true
        
        if !loginSucceded{
            let alert = UIAlertView()
            alert.title = "Oops"
            alert.message = "There was an issue logging in"
            alert.addButtonWithTitle("OK")
            alert.show()
        } else {
            let controller = self.storyboard!.instantiateViewControllerWithIdentifier("MainAppNavigationController") as! UINavigationController
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
}