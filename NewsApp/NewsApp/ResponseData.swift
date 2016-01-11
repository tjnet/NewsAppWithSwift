//
//  ResponseData.swift
//  NewsApp
//
//  Created by TanakaJun on 2015/12/31.
//  Copyright © 2015年 edu.self. All rights reserved.
//

import Foundation
import ObjectMapper

class ResponseData: Mappable {
    var feed: Feed?

    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        feed <- map["feed"]
    }
    
}
