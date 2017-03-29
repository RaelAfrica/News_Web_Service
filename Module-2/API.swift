//
//  API.swift
//  Module-2
//
//  Created by Rael Kenny on 3/29/17.
//  Copyright © 2017 LearnAppMaking. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

private let _API_SharedInstance = API()

class API {
    
    static let Feed_JSON_URL:URL = URL(string: "https://learnappmaking.com/feed/json")!
    
    class var sharedInstance: API
    {
        return _API_SharedInstance
    }
    
    func requestArticles() -> Void
    {
        Alamofire.request(API.Feed_JSON_URL).responseJSON {
            (response) in
            
            if let data = response.data
            {
                let json = JSON(data: data)
                
                print("JSON:\(json)")
                
                self.processArticles(json: json)
            }
            else
            {
                print(response.result.error)
            }
        }
    }
    
    func processArticles(json: JSON)
    {
        print(json)
    }
    
}


