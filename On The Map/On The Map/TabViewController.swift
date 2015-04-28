//
//  TabViewController.swift
//  On The Map
//
//  Created by Nicholas Busby on 4/27/15.
//  Copyright (c) 2015 Nicholas Busby. All rights reserved.
//

import Foundation
import UIKit

class TabViewController: UIViewController {
    var pins = [Pin]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPins()
    }
    
    func getPins() {
        for i in 0..<3 {
            var test = [String: AnyObject]()
            test["firstName"] = "hello"
            test["lastName"] = "world"
            test["latitude"] = 35.174 + (Double(i) * 10.0)
            test["longitude"] = -79.3922 + (Double(i) * 10.0)
            test["mapString"] = "North Carolina"
            test["mediaURL"] = "http://www.facebook.com"
            test["objectID"] = "j3jek3j3"
            test["uniqueKey"] = "3838384"
            var pin = Pin(dictionary: test)
            pins.append(pin)
        }
    }
}