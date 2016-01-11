//
//  OGPResponse.swift
//  NewsApp
//
//  Created by TanakaJun on 2015/12/31.
//  Copyright © 2015年 edu.self. All rights reserved.
//

import Foundation
import ObjectMapper

class OGPResponse: Mappable {
    var image: String?
    
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        image <- map["image"]
    }
    
}