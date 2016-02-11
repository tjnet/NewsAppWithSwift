//
//  File.swift
//  NewsApp
//
//  Created by TanakaJun on 2016/02/04.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation
import ReactiveCocoa
import Alamofire
import RealmSwift
import Realm

// A ViewModel that exposes the results of a Fetching Articles
class ArticleTableViewModel: NSObject {
    
    var title : String = ""
    var entries : Results<Entry>!
    
    override init(){
        super.init()
    }
}