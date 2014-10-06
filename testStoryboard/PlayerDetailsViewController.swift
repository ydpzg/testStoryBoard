//
//  PlayerDetailsViewController.swift
//  testStoryboard
//
//  Created by pcbeta on 14-10-4.
//  Copyright (c) 2014年 hgsoft. All rights reserved.
//

import UIKit

protocol PlayerDetailsDelegate {
    func cancel()
    func done(playerName: String, gameName: String)
}


class PlayerDetailsViewController: UITableViewController, GamePickerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    var delegate:PlayerDetailsDelegate?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NSLog("init PlayerDetailsViewController")
        
    }

    
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.delegate?.cancel()
        
        println("cancel2")
    }
    
    @IBAction func done(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        //var alertView = UIAlertView();
       //alertView.title = "hint"
        //alertView.message = "name can not be empty."
        //alertView.show()
        
        self.delegate?.done(nameTextField.text, gameName: gameLabel.text!)
        println("done2")
    }
    
    func back(game: String) {
        detailLabel.text = game
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
/*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }
*/
    /*
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }
*/
    // 把输入看到点击效果扩展到整个父布局
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.section == 0) {
            self.nameTextField.becomeFirstResponder()
        }
    }
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell

    }
    */
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
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
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "ChooseGame" {
            
            let tableController = segue.destinationViewController as? UINavigationController
            let playerDetailsViewController = tableController?.viewControllers[0] as? GamePickerViewController
            playerDetailsViewController?.delegate = self
        }
    }
    
 
}
