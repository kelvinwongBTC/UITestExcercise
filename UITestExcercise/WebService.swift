//
//  WebService.swift
//  UITestExcercise
//
//  Created by Ka Ho Wong on 21/8/18.
//  Copyright © 2018 Bigtincan. All rights reserved.
//

import UIKit

class WebService: NSObject {

    typealias RequestCallback = ([[String: Any]]) -> ()
    
    var mockResponse: [[String: Any]] {
        return
            [StoryRecord(storyId: 1, title: "t1", desc: "d1").rawData,
             StoryRecord(storyId: 2, title: "t2", desc: "d2").rawData,
             StoryRecord(storyId: 3, title: "t3", desc: "d3").rawData]
    }
    
    func createStructureRequest(callback: RequestCallback) {
        // mock Response
        let response: [[String: Any]] = mockResponse
        callback(response)
    }
}


struct StoryRecord {
    let storyId: Int
    let title: String
    let desc: String
    
    init?(rawData: [String: Any]) {
        guard let t = rawData["title"] as? String ,
            let d = rawData["desc"] as? String ,
            let Id = rawData["Id"] as? Int else {
                return nil
        }
        
        self.storyId = Id
        self.title = t
        self.desc = d
    }
    
    init(storyId: Int, title: String, desc: String) {
        self.storyId = storyId
        self.title = title
        self.desc = desc
    }
    
    var rawData: [String: Any] {
        return ["title": title, "desc": desc, "Id" : storyId]
    }
}
