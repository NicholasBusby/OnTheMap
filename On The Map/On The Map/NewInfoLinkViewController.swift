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

class NewInfoLinkViewController: UIViewController {
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
    }
    
    @IBAction func shareButtonClicked(sender: AnyObject) {
        if let link = NSURL(string: linkField.text) {
            if UIApplication.sharedApplication().canOpenURL(link){
                StudentInformationAPI().POSTStudentInformation(buildInfoHash()) { (success, error) in
                    if let e = error {
                        println(e)
                    } else {
                        dispatch_async(dispatch_get_main_queue(), {
                            self.performSegueWithIdentifier("donePostingInfo", sender: self)
                        })
                    }
                }
                return
            }
        }
        showBadLink()
    }
    
    func showBadLink(){
        let alert = UIAlertView()
        alert.title = "Bad link"
        alert.message = "Link is not valid.  Did you include 'http://'?"
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
    func buildInfoHash() -> [String: AnyObject] {
        if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate{
            let hash:[String: AnyObject] = [
                "firstName": appDelegate.user!.firstName,
                "lastName": appDelegate.user!.lastName,
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
}
