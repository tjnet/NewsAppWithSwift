//
//  GettingArticle.swift
//  NewsApp
//
//  Created by TanakaJun on 2016/02/11.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation
import ReactiveCocoa


// Provides an API for Getting Article
protocol GettingArticle {
    
    // getting articles, returning a signal that emits the response
    func gettingArticleSignal() -> RACSignal
    
}
