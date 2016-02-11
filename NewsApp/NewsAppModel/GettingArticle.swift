//
//  GettingArticle.swift
//  NewsApp
//
//  Created by TanakaJun on 2016/02/11.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation
import ReactiveCocoa
import Result


// Provides an API for Getting Article
protocol GettingArticle {
    
    // getting articles, returning a signal that emits the response
    func gettingArticleSignal(fechFrom: String, title: String) -> SignalProducer<AnyObject, NetworkError>
    
}
