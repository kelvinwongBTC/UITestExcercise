//
//  Account.swift
//  UITestExcercise
//
//  Created by Ka Ho Wong on 21/8/18.
//  Copyright © 2018 Bigtincan. All rights reserved.
//

import UIKit

class AccountRecord: NSObject, NSCoding {
    let accountId: Int
    let email: String
    
    init(accountId: Int, email: String) {
        self.accountId = accountId
        self.email = email
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        let IdNum = aDecoder.decodeObject(forKey: "accountId") as! NSNumber
        self.init(accountId: IdNum.intValue,
                  email: aDecoder.decodeObject(forKey: "email") as! String)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.email, forKey: "email")
        aCoder.encode(NSNumber(value: self.accountId), forKey: "accountId")
    }
    
}

class Account: NSObject {
    
    let accountRecord: AccountRecord
    let webService: WebService
    let dataManager: CoreDataController
    let syncManager: SyncManager
    
    init(record: AccountRecord) {
        self.accountRecord = record
        self.dataManager = CoreDataController()
        self.webService = WebService()
        self.syncManager = SyncManager(webService: self.webService, dataManager: self.dataManager)
    }
    
}
