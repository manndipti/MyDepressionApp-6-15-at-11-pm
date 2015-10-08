//
//  ExploreViewController.swift
//  MyDepressionApp
//
//  Created by student on 6/6/15.
//  Copyright (c) 2015 Mayur. All rights reserved.
//

import UIKit
import Parse

class ExploreViewController: UIViewController {

    @IBOutlet weak var logOut: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser =  PFUser.currentUser()
        if (currentUser == nil) {
            logOut.enabled = false
            
        }
         
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LogoutButton(sender: AnyObject) {
        PFUser.logOut()
        var alert = UIAlertView(title: "Success", message: "Loged out", delegate: self, cancelButtonTitle: "OK" )
        alert.show()
        logOut.enabled = false
        self.navigationController?.popToRootViewControllerAnimated(true)
      // self.performSegueWithIdentifier("LogOut", sender: self)
        
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
