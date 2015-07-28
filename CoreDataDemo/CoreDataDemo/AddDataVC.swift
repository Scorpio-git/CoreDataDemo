//
//  AddDataVC.swift
//  CoreDataDemo
//
//  Created by 王文建 on 15/7/28.
//  Copyright (c) 2015年 王文建. All rights reserved.
//

import UIKit
import CoreData

class AddDataVC: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfID: UITextField!
    var context:NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addBtnAction(sender: AnyObject) {
        //插入数据
        var info :AnyObject = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context!)
        var name = tfName.text
        var age = tfAge.text.toInt()
        var id = tfID.text
        info.setValue(name, forKey: "name")
        info.setValue(age, forKey: "year")
        info.setValue(id, forKey: "id")
        context.save(nil)
        navigationController?.popViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
