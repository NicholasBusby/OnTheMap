//
//  NewInfoLinkViewController.swift
//  On The Map
//
//  Created by Nicholas Busby on 5/18/15.
//  Copyright (c) 2015 Nicholas Busby. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class NewInfoLinkViewController: UIViewController, UITextFieldDelegate {
    var region: MKCoordinateRegion?
    var mapString: String?
    
    @IBOutlet weak var linkField: UITextField!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if region != nil {
            map.setRegion(region!, animated: true)
        }
        linkField.delegate = self
    }
    
    @IBAction func shareButtonClicked(sender: AnyObject) {
        StudentInformationAPI().POSTStudentInformation(buildInfoHash()) { (success, error) in
            if let e = error {
                println(e)
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    self.performSegueWithIdentifier("donePostingInfo", sender: self)
                })
            }
        }
    }
    
    func buildInfoHash() -> [String: AnyObject] {
        if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate{
            let hash:[String: AnyObject] = [
                "firstName": "first",
                "lastName": "last",
                "latitude": region!.center.latitude,
                "longitude": region!.center.longitude,
                "mapString": mapString!,
                "mediaURL": linkField.text,
                "uniqueKey": appDelegate.user!.id
                
            ]
            return hash
        }
        return [:]
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let currentString = textField.text + string
        println(currentString)
        if let link = NSURL(string: currentString){
            self.shareButton.enabled = true
            return true
        }
        self.shareButton.enabled = false
        return true
    }
}
