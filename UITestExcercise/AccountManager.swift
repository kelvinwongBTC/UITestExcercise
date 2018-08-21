//
//  AccountManager.swift
//  UITestExcercise
//
//  Created by Ka Ho Wong on 21/8/18.
//  Copyright © 2018 Bigtincan. All rights reserved.
//

import UIKit

protocol AccountManagerDelegate: class {
    func didSignIn()
    func didSignOut()
}

class AccountManager: NSObject {
    
    weak var delegate: AccountManagerDelegate?
    
    var currentAccount: Account? {
        if let data = UserDefaults.standard.object(forKey: "loginedAccount") as? Data,
            let record =  NSKeyedUnarchiver.unarchiveObject(with: data) as? AccountRecord {
            
            return Account(record: record)
        }
        
        return nil
    }
    
    func signInWithAccountRecord(record: AccountRecord) {
        let data = NSKeyedArchiver.archivedData(withRootObject: record)
        UserDefaults.standard.set(data, forKey: "loginedAccount")
        delegate?.didSignIn()
    }
    
    func signOut() {
        UserDefaults.standard.removeObject(forKey: "loginedAccount")
        delegate?.didSignOut()
    }
    
    static var shared: AccountManager {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.accountManager
    }
}
