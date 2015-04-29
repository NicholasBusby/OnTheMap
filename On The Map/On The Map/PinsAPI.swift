//
//  PinsAPI.swift
//  On The Map
//
//  Created by Nicholas Busby on 4/29/15.
//  Copyright (c) 2015 Nicholas Busby. All rights reserved.
//

import Foundation

class PinsAPI {
    
    func GETPins(completionHandler: (pins: [Pin]?, success: Bool, error: String?) -> Void) {
        var headers = buildHeaders()
        var getPinRequest = APIHelper.getRequest(APIHelper.BaseURLs.MapAPI, api: APIHelper.APIs.StudentLocation, headers: headers, queryString: [String: String]())
        var task = APIHelper.buildTask(getPinRequest){ (data, error) in
            if let e = error{
                completionHandler(pins: nil, success: false, error: "There was an issue contacting the server")
            } else {
                let response = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as? [String: AnyObject]
                if let error = response!["error"] as? String{
                    completionHandler(pins: nil, success: false, error: error)
                } else {
                    var pins = [Pin]()
                    var pinsJSON = response!["results"] as! [[String: AnyObject]]
                    for pinJSON in pinsJSON {
                        pins.append(self.buildPin(pinJSON))
                    }
                    completionHandler(pins: pins, success: true, error: nil)
                }
            }
        }
    }
    
    func buildHeaders() -> [String: String] {
        return [
            "X-Parse-Application-Id": APIHelper.MapKeys.ParseApplicationID,
            "X-Parse-REST-API-Key": APIHelper.MapKeys.ParseAPIKey
        ]
    }
    
    func buildPin(jsonResponse: [String: AnyObject]) -> Pin {
        let pin = Pin(dictionary: jsonResponse)
        return pin
    }
}