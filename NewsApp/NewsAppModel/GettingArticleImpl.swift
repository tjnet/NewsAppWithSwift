//
//  GettingArticleImpl.swift
//  NewsApp
//
//  Created by TanakaJun on 2016/02/11.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation
import ReactiveCocoa


class GettingArticleImpl : NSObject, GettingArticle {
    
    func gettingArticleSignal() -> RACSignal {
        return RACSignal.empty().logAll()
    }
}
