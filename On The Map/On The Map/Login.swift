//
//  Login.swift
//  On The Map
//
//  Created by Nicholas Busby on 4/23/15.
//  Copyright (c) 2015 Nicholas Busby. All rights reserved.
//

import Foundation

class Login {
    func attemptToLogIn(email: String, password: String){
        var body = [
            "udacity": [
                "userName": email,
                "password": password
            ]
        ]
elf        var loginRequest = APIHelper.postRequest(APIHelper.BaseURLs.Login, api: APIHelper.APIs.Session, body: body, headers: nil, queryString: nil)
        var task = APIHelper.buildTask(loginRequest){
            println(data)
            println(error)
        }
    }
}
