//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by 王文建 on 15/7/27.
//  Copyright (c) 2015年 王文建. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        // 插入对象
//        var row :AnyObject = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context!)
//        var str = NSString()
//        row.setValue("wwj", forKey: "name")
//        row.setValue("411522", forKey: "id")
//        row.setValue(26, forKey: "year")
//        context?.save(nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

