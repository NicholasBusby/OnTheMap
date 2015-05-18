//
//  TableViewController.swift
//  On The Map
//
//  Created by Nicholas Busby on 4/27/15.
//  Copyright (c) 2015 Nicholas Busby. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: TabViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pins.count
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pinCell") as! UITableViewCell
        
        let pin = self.pins[indexPath.row]
        cell.textLabel?.text = pin.firstName + " " + pin.lastName
        cell.detailTextLabel?.text = pin.mediaURL
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        goToURL(pins[indexPath.row].mediaURL)
    }
    
    override func usePins() {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
        })
    }
}
