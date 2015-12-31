//
//  Article.swift
//  NewsApp
//
//  Created by TanakaJun on 2015/12/31.
//  Copyright © 2015年 edu.self. All rights reserved.
//

import UIKit

class Article {
    var title: String
    var description: String
    var thumbnail: String
    var url: String
    
    init(title: String, description: String, thumbnail: String, url: String){
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
        self.url = url
    }
}
