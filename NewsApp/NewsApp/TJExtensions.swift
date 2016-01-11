//
//  TJExtensions.swift
//  NewsApp
//
//  Created by TanakaJun on 2016/01/11.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation
import UIKit
import WebImage

extension UIImageView {
    func loadWebImage(url:NSURL!){
        self.sd_setImageWithURL(url)
    }
    
    func loadWebImage(url:NSURL!, placeholderImage:UIImage!) {
        self.sd_setImageWithURL(url, placeholderImage: placeholderImage)
    }
    
    func loadWebImage(url:NSURL!, placeholderImage:UIImage!,completeion:SDWebImageCompletionBlock){
        self.sd_setImageWithURL(url, placeholderImage: placeholderImage, completed: completeion)
    }
}