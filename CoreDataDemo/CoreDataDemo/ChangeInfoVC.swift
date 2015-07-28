//
//  ChangeInfoVC.swift
//  CoreDataDemo
//
//  Created by 王文建 on 15/7/27.
//  Copyright (c) 2015年 王文建. All rights reserved.
//

import UIKit
import CoreData

class ChangeInfoVC: UIViewController {

    var data:NSManagedObject!
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tfName.text = data.valueForKey("name") as! String
        var age = data.valueForKey("year") as! Int
        tfAge.text = "\(age)"
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionSubmit(sender: AnyObject) {
        
        // 修改对象
        data.setValue(tfName.text, forKey: "name")
        data.setValue(tfAge.text.toInt(), forKey: "year")
        // 保存对象
        data.managedObjectContext?.save(nil)
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func actionCancel(sender: AnyObject) {
    
//        navigationController?.popToRootViewControllerAnimated(true)
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
