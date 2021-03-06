//
//  TestUITableViewController.swift
//  testStoryboard
//
//  Created by pcbeta on 14-10-3.
//  Copyright (c) 2014年 hgsoft. All rights reserved.
//

import UIKit

class TestUITableViewController: UITableViewController, PlayerDetailsDelegate {
    var delegate:PlayerDetailsDelegate?
    
    @IBOutlet var rootTableView: UITableView!
    var data : NSMutableArray = NSMutableArray()
    
    func done(playerName: String, gameName: String) {
        
       
        var indexPath = NSIndexPath(forRow:data.count,inSection:0)
        data.addObject(playerName)
        self.tableView?.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        //var indexPath = NSIndexPath.index
        
        //NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.players count] - 1) inSection:0];
        //[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

    }
    func cancel() {
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        data.addObject("123")
        data.addObject("456")
        data.addObject("789")
        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

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
        return data.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as TestTableViewCell
        cell.title.text = data[indexPath.row] as? String
        
        
        // Configure the cell...

        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        /*
        if editingStyle == .Delete {
            // Delete the row from the data source
            data.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        } 
        */
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "AddPlayer" {
        
            let tableController = segue.destinationViewController as? UINavigationController
            let playerDetailsViewController = tableController?.viewControllers[0] as? PlayerDetailsViewController
            playerDetailsViewController?.delegate = self
        }
   
    }
    

}
