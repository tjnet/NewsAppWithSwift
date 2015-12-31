//
//  Entry.swift
//  NewsApp
//
//  Created by TanakaJun on 2015/12/31.
//  Copyright © 2015年 edu.self. All rights reserved.
//

import Foundation
import ObjectMapper

class Entry: Mappable {
    //var entries: [Entry]?
    //    var threeDayForecast: [Forecast]?
    var title: String?
    var link: String?
    var contentSnippet: String?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        link <- map["link"]
        contentSnippet <- map["contentSnippet"]
    }
    
}
