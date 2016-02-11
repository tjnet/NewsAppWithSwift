//
//  ViewModelServicesImpl.swift
//  NewsApp
//
//  Created by TanakaJun on 2016/02/11.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation
import UIKit

class ViewModelServicesImpl: ViewModelServices {
    
    private let navigationController: UINavigationController
    let gettingArticleService: GettingArticle
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.gettingArticleService = GettingArticleImpl()
    }
    
}
