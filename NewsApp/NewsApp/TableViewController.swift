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
import Realm
import SafariServices

class TableViewController: UITableViewController {
    
    var lists : Results<Entry>!
    
    var fetchFrom: String = ""
    
    private let viewModel: ArticleTableViewModel
    
    
    init(viewModel: ArticleTableViewModel){
        self.viewModel = viewModel
        
        super.init(nibName: "TableViewController", bundle: nil)
        

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        
        self.tableView.registerNib(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
        
        Alamofire.request(.GET, fetchFrom).responseObject("responseData") { (response: Alamofire.Response<FeedResponse, NSError>) in
            
            guard let entries = response.result.value?.feed?.entries else {
                return
            }
            
            print(entries)
            print("Our default realm is located at \(RLMRealm.defaultRealm().path)")
            
            try! uiRealm.write { () -> Void in
                
                for entry in entries {
                    entry.category = self.title!
                    
                    //see https://github.com/realm/realm-cocoa/issues/2149
                    //see https://realm.io/docs/swift/latest/api/Classes/Realm.html#/s:FC10RealmSwift5Realm3adduRq_Ss12SequenceTypedqqq_S1_9GeneratorSs13GeneratorType7ElementCS_6Object_FS0_FTq_6updateSb_T_
                    
                    uiRealm.add(entry, update: true)
                    
                }
            }
            self.readEntriesAndUpdateUI()

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
        
        if let listEntries = lists{
            return listEntries.count
        }
        return 0
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell : FeedTableViewCell = tableView.dequeueReusableCellWithIdentifier("FeedTableViewCell") as! FeedTableViewCell
    
        // Configure the cell...
        let entry = lists[indexPath.row] as Entry
        
        cell.configure(entry)
        
    
        return cell
    }
    
    private func bindViewModel() {
        
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let entry = lists[indexPath.row] as Entry
        
        let svc = SFSafariViewController(URL: NSURL(string: entry.link)!)
        self.presentViewController(svc, animated: true, completion: nil)

        
        reloadRowsAtIndexPath(indexPath)
    }
    
    
    func reloadRowsAtIndexPath(indexPath: NSIndexPath) {
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
    }

    
}
