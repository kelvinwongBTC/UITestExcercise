//
//  SyncManager.swift
//  UITestExcercise
//
//  Created by Ka Ho Wong on 21/8/18.
//  Copyright © 2018 Bigtincan. All rights reserved.
//

import UIKit

class SyncManager: NSObject {
    
    let dataManager: CoreDataController
    let webService: WebService
    
    init(webService: WebService, dataManager: CoreDataController) {
        self.webService = webService
        self.dataManager = dataManager
    }

}
