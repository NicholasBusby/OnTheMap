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
        var pinAPI = PinsAPI()
        pinAPI.GETPins(){ (pins, success, error) in
            if success{
                self.pins = pins!
                self.usePins()
            } else {
                println(error)
            }
        }
    }
    
    func goToURL(url: String) {
        var link = NSURL(string: url)
        UIApplication.sharedApplication().openURL(link!)
    }
    
    func usePins(){
        
    }
}
