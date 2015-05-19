//
//  User.swift
//  On The Map
//
//  Created by Nicholas Busby on 4/24/15.
//  Copyright (c) 2015 Nicholas Busby. All rights reserved.
//

import Foundation

struct User {
    var id = ""
    var key = ""
    var firstName = ""
    var lastName = ""
    
    init(dictionary: [String: AnyObject]){
        if let session = dictionary["session"] as? [String: AnyObject] {
            if let account = dictionary["account"] as? [String: AnyObject] {
                id = session["id"] as! String
                key = account["key"] as! String
            }
        }
    }
}