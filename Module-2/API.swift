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
import RealmSwift

private let _API_SharedInstance = API()

class API {
    
    static let Feed_JSON_URL:URL = URL(string: "https://learnappmaking.com/feed/json")!
    static let articlesReceivedNotification = Notification.Name("articlesReceived")
    
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
        
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        let realm = try! Realm()
        realm.beginWrite()
        
        for (key, item):(String, JSON) in json
        {
            var article = Article()
            
            if let id:Int = item["id"].int {
                article.id = id
            }
            
            if let title:String = item["title"].string {
                article.title = title
            }
            
            if let author:String = item["author"].string {
                article.author = author
            }
            
            if let excerpt:String = item["excerpt"].string {
                article.excerpt = excerpt
            }
            
            if let content:String = item["content"].string {
                article.content = content
            }
            
            if let articleURL:String = item["permalink"].string {
                article.articleURL = articleURL
            }
            
            if let thumbnailURL:String = item["thumbnail"].string {
                article.thumbnailURL = thumbnailURL
            }
            
            if  let dateString = item["date"].string,
                let creationDate = dateFormatter.date(from: dateString)
            {
                article.creationDate = creationDate
            }
            
            realm.add(article, update: true)
        }
        
        do {
            try realm.commitWrite()
            print("Committing write...")
        }
        catch (let e)
        {
            print("Y U NO REALM ?\(e)")
        }
        
        NotificationCenter.default.post(name: API.articlesReceivedNotification, object:nil)
    }
    
}


