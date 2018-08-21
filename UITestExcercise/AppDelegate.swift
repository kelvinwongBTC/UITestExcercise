//
//  AppDelegate.swift
//  UITestExcercise
//
//  Created by Ka Ho Wong on 21/8/18.
//  Copyright © 2018 Bigtincan. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var accountManager: AccountManager!
    var currentAccount: Account?
    
    var signInViewController: SignInViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.accountManager = AccountManager()
        self.accountManager.delegate = self

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateInitialViewController()
        
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        guard ProcessInfo.processInfo.isUITesting == false else {
            let loginState = ProcessInfo.processInfo.testingEnvironment?.loginState ?? .login
            switch loginState {
            case .login:
                attempToSignIn()
            case .logout:
                presentSignInViewController(animated: false)
            }
            return true 
        }
        
        if let account = accountManager.currentAccount {
            currentAccount = account
        } else {
            //present sign in view
            presentSignInViewController(animated: false)
        }
        
        return true
    }
    
    func presentSignInViewController(animated: Bool) {
        assert(signInViewController == nil)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = storyBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        signInVC.delegate = self
        guard let viewController = window?.rootViewController else {
            return
        }
        
        viewController.present(signInVC, animated: animated, completion: nil)
        signInViewController = signInVC
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
//        self.saveContext()
    }

}

extension AppDelegate: SignInViewControllerDelegate {
    func attempToSignIn() {
        let customSignInRecord = AccountRecord(accountId: 1, email: "test@email.com")
        self.accountManager.signInWithAccountRecord(record: customSignInRecord)
    }
}

extension AppDelegate: AccountManagerDelegate {
    func didSignIn() {
        assert(accountManager.currentAccount != nil)
        self.currentAccount = accountManager.currentAccount
        
        signInViewController?.dismiss(animated: true) {
            self.signInViewController = nil
        }
    }
    
    func didSignOut() {
        presentSignInViewController(animated: true)
    }
}

extension ProcessInfo {
    /**
     Used to recognized that UITestings are running and modify the app behavior accordingly
     
     Set with: XCUIApplication().launchArguments = [ "isUITesting" ]
     */
    var isUITesting: Bool {
        return arguments.contains("isUITesting")
    }
    
    var testingEnvironment: UITestEnvironment? {
        guard isUITesting else {
            return nil
        }
        
        return UITestEnvironment(rawData: environment)
    }
}



