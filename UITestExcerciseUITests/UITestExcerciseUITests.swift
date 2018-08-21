//
//  UITestExcerciseUITests.swift
//  UITestExcerciseUITests
//
//  Created by Ka Ho Wong on 21/8/18.
//  Copyright © 2018 Bigtincan. All rights reserved.
//

import XCTest

class UITestExcerciseUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSignIn() {
        let app = XCUIApplication()
        // make sure logout state
        app.launchArguments = ["isUITesting"]
        app.launchEnvironment = UITestEnvironment(loginState: .logout).rawData
        app.launch()

        app.buttons["Sign In"].tap()
        XCTAssertTrue(app.navigationBars["Root View Controller"].buttons["Sign out"].exists)
    }
    
    func testSignOut() {
        let app = XCUIApplication()
        // make sure login state
        app.launchArguments = ["isUITesting"]
        app.launch()

        XCTAssertTrue(app.navigationBars["Root View Controller"].buttons["Sign out"].exists)
        app.navigationBars["Root View Controller"].buttons["Sign out"].tap()
        XCTAssertTrue(app.buttons["Sign In"].exists)
    }
    
}

//extension XCUIApplication {
//    var isDisplayingRootView: Bool {
//        return otherElements["Sign out"].exists
//    }
//
//    var isDisplayingLoginView: Bool {
//        return
//    }
//}

