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
    var studentInformations = [StudentInformation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()
    }
    
    func getInfo() {
        var infoAPI = StudentInformationAPI()
        infoAPI.GETStudentInformations(){ (info, success, error) in
            if success{
                self.studentInformations = info!
                self.useInfo()
            } else {
                println(error)
                let alert = UIAlertView()
                alert.title = "Alert"
                alert.message = "Could not retrieve Student Information"
                alert.addButtonWithTitle("OK")
                alert.show()
            }
        }
    }
    
    func goToURL(url: String) {
        if let link = NSURL(string: url){
            UIApplication.sharedApplication().openURL(link)
            return
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
    
    func useInfo(){}
}
