//
//  Article.swift
//  Module-2
//
//  Created by Rael Kenny on 3/29/17.
//  Copyright © 2017 LearnAppMaking. All rights reserved.
//

import Foundation
import RealmSwift

class Article:Object
{
    dynamic var id:Int = 0
    dynamic var title:String = ""
    dynamic var author:String = ""
    dynamic var content:String = ""
    dynamic var thumbnailURL:String = ""
    dynamic var articleURL:String = ""
    dynamic var excerpt:String = ""
    dynamic var creationDate:Date = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

