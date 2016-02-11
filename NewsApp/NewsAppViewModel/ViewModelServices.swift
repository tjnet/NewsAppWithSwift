//
//  ViewModelServices.swift
//  NewsApp
//
//  Created by TanakaJun on 2016/02/11.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation

// provides common services to view models
protocol ViewModelServices {
    
    var gettingArticleService: GettingArticle { get }
}