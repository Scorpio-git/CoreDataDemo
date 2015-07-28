//
//  TableVC.swift
//  CoreDataDemo
//
//  Created by 王文建 on 15/7/27.
//  Copyright (c) 2015年 王文建. All rights reserved.
//

import UIKit
import CoreData

class TableVC: UITableViewController {

//    var dataArr: [AnyObject]!
    var dataArr:Array<AnyObject> = []
    var context:NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        // 创建链接
        context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
//        refreshData()
    }

    func refreshData(){
        //获取对象
        var f = NSFetchRequest(entityName: "User")
        dataArr = context.executeFetchRequest(f , error: nil)!
        
        tableView.reloadData()
//        UITabBarController
    }
    
    override func viewWillAppear(animated: Bool) {
        self.refreshData()
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
        return dataArr.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("IdCell") as! UITableViewCell
        var label = cell.viewWithTag(111) as! UILabel
        var name = dataArr[indexPath.row].valueForKey("name") as! String
        var age: AnyObject? = dataArr[indexPath.row].valueForKey("year")
        var id: AnyObject?  = dataArr[indexPath.row].valueForKey("id")
        var str = "name:\(name) ... ,age:\(age!)"
        label.text = str
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ChangeInfo" {
            if let indexPath = self.tableView.indexPathForSelectedRow(){
                let object = self.dataArr[indexPath.row] as! NSManagedObject
                (segue.destinationViewController as! ChangeInfoVC).data = object
            }
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if  editingStyle == UITableViewCellEditingStyle.Delete{
//            dataArr.removeAtIndex(indexPath.row)
            context.deleteObject(dataArr[indexPath.row] as! NSManagedObject)
            context.save(nil)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            
        }
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

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
