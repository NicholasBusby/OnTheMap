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
        if let link = NSURL(string: url){
            if UIApplication.sharedApplication().canOpenURL(link){
                UIApplication.sharedApplication().openURL(link)
                return
            }
        }
        showBadURLMessage()
    }
    
    func showBadURLMessage(){
        let alert = UIAlertView()
        alert.title = "Bad URL"
        alert.message = "This person entered an invalid Email"
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
    func usePins(){}
}
