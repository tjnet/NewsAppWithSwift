//
//  TableViewController.swift
//  NewsApp
//
//  Created by TanakaJun on 2015/12/31.
//  Copyright © 2015年 edu.self. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import Foundation

class TableViewController: UITableViewController {
    
    //Set up sample data
    var articlesData = [
        Article(title:"News1", description: "News1 description", thumbnail: "https://placehold.it/140x100", url: "http://google.co.jp"),
        Article(title:"News2", description: "News2 description", thumbnail: "https://placehold.it/140x100", url: "http://yahoo.co.jp"),
        Article(title:"News3", description: "News3 description", thumbnail: "https://placehold.it/140x100", url: "http://google.co.jp"),
        Article(title:"News4", description: "News4 description", thumbnail: "https://placehold.it/140x100", url: "http://menthas.com/"),
    ]
    
    var fetchFrom: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerNib(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
        
//        Alamofire.request(.GET, fetchFrom).responseJSON {
//            response in
//            if response.result.isSuccess {
//                print(response)
//            }
//        }
        

        Alamofire.request(.GET, fetchFrom, parameters: nil, encoding: .JSON)
            .responseJSON { response in
//                print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization
                
                
                
                
                        print(response)
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articlesData.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell : FeedTableViewCell = tableView.dequeueReusableCellWithIdentifier("FeedTableViewCell") as! FeedTableViewCell

        let article = articlesData[indexPath.row] as Article
        cell.titleLabel.text = article.title
        cell.descriptionLabel.text = article.description

        let imageUrl = NSURL(string: article.thumbnail)
        let data = NSData(contentsOfURL: imageUrl!)
        cell.thumbnailImageView.image = UIImage(data: data!)
    


        

        // Configure the cell...

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 180.0
    }

    
}
