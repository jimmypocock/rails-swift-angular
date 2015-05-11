//
//  UsersTableViewController.swift
//  json-test-app
//
//  Created by Jimmy Pocock on 5/10/15.
//  Copyright (c) 2015 Jimmy Pocock. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    var users = [""]
    var refresher:UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
//        updateUsers()
        
//        refresher = UIRefreshControl()
//        refresher.attributedTitle = NSAttributedString(string: "Refreshing...")
//        refresher.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
//        self.tableView.addSubview(refresher)
        
    }
    
//    func updateUsers() {
//        var query = PFUser.query()
//        query?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
//            self.users.removeAll(keepCapacity: true)
//            for object in objects! {
//                var user:PFUser = object as! PFUser
//                var isFollowing:Bool
//                if user.username != PFUser.currentUser()?.username {
//                    self.users.append(user.username!)
//                    isFollowing = false
//                    var query = PFQuery(className: "Follow")
//                    query.whereKey("follower", equalTo: PFUser.currentUser()!.username!)
//                    query.whereKey("following", equalTo: user.username!)
//                    query.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
//                        if error == nil {
//                            for object in objects! {
//                                isFollowing = true
//                            }
//                            self.following.append(isFollowing)
//                            
//                            // This should be somewhere else
//                            self.tableView.reloadData()
//                        } else {
//                            println(error)
//                        }
//                        self.refresher.endRefreshing()
//                    })
//                }
//            }
//        })
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
//        return users.count
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("User", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = String(indexPath.row)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
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
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */

}
