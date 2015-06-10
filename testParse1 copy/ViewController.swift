//
//  ViewController.swift
//  testParse1
//
//  Created by Eital Schattner-Elmaleh on 6/9/15.
//  Copyright (c) 2015 Eital Schattner-Elmaleh. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ViewController: UIViewController {

    @IBOutlet weak var nameEnglish: UITextField!
    @IBOutlet weak var nameLocal: UITextField!
    @IBOutlet weak var capital: UITextField!
    

    
    
  //  @IBOutlet weak var currencyCode: UITextField!
    
    var currentObject : PFObject?


    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let object = currentObject {
            
            
            nameEnglish.text = object["nameEnglish"] as! String
           // nameLocal.text = object["local"] as! String
           // capital.text = object["capital"] as! String
            //currencyCode.text = object["currencyCode"] as! String
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        // Unwrap the current object object
        if let object = currentObject {
            
            object["nameEnglish"] = nameEnglish.text
            //object["nameLocal"] = nameLocal.text
            //object["capital"] = capital.text
            //object["currencyCode"] = currencyCode.text
            
            // Save the data back to the server in a background task
            object.saveEventually(nil)
            
        }
        
        // Return to table view
        self.navigationController?.popViewControllerAnimated(true)
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
