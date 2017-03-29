//
//  Article.swift
//  Module-2
//
//  Created by Rael Kenny on 3/29/17.
//  Copyright © 2017 LearnAppMaking. All rights reserved.
//

import Foundation

class Article: CustomStringConvertible
{
    var id:Int = 0
    var title:String = ""
    var author:String = ""
    var content:String = ""
    var thumbnailURL:String = ""
    var articleURL:String = ""
    var excerpt:String = ""
    var creationDate:Date = Date()
    
    var description:String {
        return "Article: \(self.creationDate) -- \(self.title) -- \(self.articleURL)"
    }
}

