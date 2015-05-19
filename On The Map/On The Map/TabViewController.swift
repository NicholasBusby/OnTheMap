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
                self.showFailureToDownloadMessage()
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
    
    func showFailureToDownloadMessage(){
        let alert = UIAlertView()
        alert.title = "issue getting data"
        alert.message = "Encountered an error loading data. Please try again later"
        alert.addButtonWithTitle("OK")
        dispatch_async(dispatch_get_main_queue(), {
            alert.show()
        })
    }
    
    func useInfo(){}
}
