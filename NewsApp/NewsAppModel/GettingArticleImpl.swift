//
//  GettingArticleImpl.swift
//  NewsApp
//
//  Created by TanakaJun on 2016/02/11.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation
import ReactiveCocoa
import Alamofire
import AlamofireObjectMapper
import RealmSwift
import Realm

// An implementation of the GettingArticle protocol
class GettingArticleImpl : NSObject, GettingArticle {
    
    // MARK: Public API
    
    func gettingArticleSignal(fetchFrom: String, title: String) -> RACSignal {
        
        // request 
        return RACSignal.empty().logAll()
    }

}
