//
//  UITestEnvironment.swift
//  UITestExcercise
//
//  Created by Ka Ho Wong on 21/8/18.
//  Copyright © 2018 Bigtincan. All rights reserved.
//

struct UITestEnvironment {
    enum LoginState: String {
        case login //default is login state
        case logout
    }
    
    let loginState: LoginState
    
    init(loginState: LoginState) {
        self.loginState = loginState
    }
    
    var rawData: [String : String] {
        return ["loginState": loginState.rawValue]
    }
    
    init?(rawData: [String : String]) {
        if let stateString = rawData["loginState"], let state = LoginState(rawValue: stateString) {
            self.loginState = state
        } else {
            self.loginState = .login
        }
    }
}
