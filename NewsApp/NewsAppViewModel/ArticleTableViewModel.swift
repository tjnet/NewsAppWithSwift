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

// A ViewModel that exposes the results of a Getting Articles
class ArticleTableViewModel: NSObject {
    
    //MARK: Properties
    
    private let services: ViewModelServices
    
    var title : String = ""
    var entries : Results<Entry>!
    
    //MARK: Public API
    
    init(services: ViewModelServices){
        self.services = services
        super.init()
        
    }
}