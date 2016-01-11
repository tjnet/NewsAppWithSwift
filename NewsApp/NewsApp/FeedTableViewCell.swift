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
    
    var link: String! {
        didSet {
            Alamofire.request(.GET, ArticleAPI.ogpImage + link).responseObject("") { (response: Response<OGPResponse, NSError>) in
                var imageUrl: NSURL?
                let ogpResponse = response.result.value
                if let ogpImgSrc = ogpResponse?.image {
                        imageUrl = NSURL(string: ogpImgSrc)
//                        print(imageUrl)
                        self.setThumbnailWithFadeInAnimation(imageUrl)
                }
            }
        }
    }

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
        self.link = entry.link
    }
    
    func setThumbnailWithFadeInAnimation(imageUrl: NSURL!){
        self.thumbnailImageView.loadWebImage(imageUrl, placeholderImage: nil, completeion: {
            (image, error, cacheType, url) ->Void in
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
