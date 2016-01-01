//
//  FeedTableViewCell.swift
//  NewsApp
//
//  Created by TanakaJun on 2015/12/31.
//  Copyright © 2015年 edu.self. All rights reserved.
//

import UIKit
import WebImage
import Alamofire


class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var url: String = ""
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(entry: Entry){
        titleLabel.text = entry.title
        descriptionLabel.text = entry.contentSnippet
        var link = entry.link

        
        var imageUrl: NSURL?
        
        Alamofire.request(.GET, "http://api.hitonobetsu.com/ogp/analysis?url=" + entry.link).responseObject("") { (response: Response<OGPResponse, NSError>) in
            
            let ogpResponse = response.result.value

            
            if let ogpImgSrc = ogpResponse?.image {
                if ogpImgSrc.rangeOfString("http://") == nil{
                    imageUrl = NSURL(string: ogpImgSrc)
                }
            }else {
                imageUrl = NSURL(string: "http://capture.heartrails.com/400x300/cool?" + link)!
            }
            

            print(imageUrl)
            
            self.thumbnailImageView.sd_setImageWithURL(imageUrl, placeholderImage: nil, options: SDWebImageOptions.RefreshCached, completed: { (image, error, cacheType, url) ->Void in
                //        thumbnailImageView.sd_setImageWithURL(imageUrl, placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
                if (cacheType == SDImageCacheType.None && image != nil) {
                    self.thumbnailImageView.alpha = 0;
                    UIView.animateWithDuration(2.0, animations: { () -> Void in
                        self.thumbnailImageView.alpha = 1
                    })
                } else {
                    self.thumbnailImageView.alpha = 1;
                }
            })


        }
        
        
        
        
        

        
        
    }
    
    
}
