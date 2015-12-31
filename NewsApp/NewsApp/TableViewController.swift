//
//  TableViewController.swift
//  NewsApp
//
//  Created by TanakaJun on 2015/12/31.
//  Copyright © 2015年 edu.self. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
import AlamofireObjectMapper
import RealmSwift

class TableViewController: UITableViewController {
    
    var lists : Results<Entry>!
    
    var fetchFrom: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerNib(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
        
        Alamofire.request(.GET, fetchFrom).responseObject("responseData") { (response: Response<FeedResponse, NSError>) in
            
            let feedResponse = response.result.value
            print(feedResponse?.feed?.entries)
            
            
            if let entries = feedResponse?.feed?.entries {
                
                try! uiRealm.write { () -> Void in
                    
                    let predicate = NSPredicate(format: "category = %@", self.title!)
                    if let categorizedEntries: Results<Entry> = uiRealm.objects(Entry).filter(predicate) {
                        uiRealm.delete(categorizedEntries)
                    }

                    for entry in entries {
                        entry.category = self.title!
                        uiRealm.add(entry)
                        
                        print(entry.title)
                    }
                    

                }
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        readEntriesAndUpdateUI()
    }
    
    func readEntriesAndUpdateUI(){
        
        let predicate = NSPredicate(format: "category = %@", self.title!)
        lists = uiRealm.objects(Entry).filter(predicate)

        self.tableView.reloadData()
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
        return lists.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell : FeedTableViewCell = tableView.dequeueReusableCellWithIdentifier("FeedTableViewCell") as! FeedTableViewCell

    
        // Configure the cell...
        let entry = lists[indexPath.row] as Entry
        cell.titleLabel.text = entry.title
        cell.descriptionLabel.text = entry.contentSnippet

        let imageUrl = NSURL(string: "https://placehold.it/140x100")
        let data = NSData(contentsOfURL: imageUrl!)
        cell.thumbnailImageView.image = UIImage(data: data!)

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
