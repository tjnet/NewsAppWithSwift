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
import Result

// An implementation of the GettingArticle protocol
class GettingArticleImpl : NSObject, GettingArticle {
    
    private let network: Networking
    
    public init(network: Networking){
        self.network = network
    }

    // MARK: Public API
    
    func gettingArticleSignal(fetchFrom: String, title: String) -> SignalProducer<AnyObject, NetworkError> {
        
        // request
        return network.requestJSON(fetchFrom, parameters: nil)
    

    }

}
