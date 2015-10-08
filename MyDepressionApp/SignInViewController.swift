
//
//  ViewController.swift
//  MyDepressionApp
//
//  Created by student on 6/6/15.
//  Copyright (c) 2015 Mayur. All rights reserved.
//

import UIKit
import Parse

class SignInViewController: UIViewController {

    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0,150,150)) as UIActivityIndicatorView
     let permission = ["public_profile"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
       
        view.addSubview(self.actInd)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 /*   func textFieldShoudReturn(textField: UITextField) -> Bool {
        userID.resignFirstResponder()
        Password.resignFirstResponder()
        return true
        
    }*/
    @IBAction func SignInButton(sender: AnyObject) {
        
        var userName = self.userID.text
        var password = self.Password.text
        
        if count(userName ) < 4 || count(password) < 6 {
            var alert = UIAlertView(title: "Invalid", message: "UserName has to be more than 4 character and password should be 6 or more character long", delegate: self, cancelButtonTitle: "OK" )
            alert.show()
            
        }else {
            
            self.actInd.startAnimating()
           
            PFUser.logInWithUsernameInBackground(userName, password: password, block: { (user, error) -> Void in
                self.actInd.stopAnimating()
                    if user !=  nil {
                
                        var alert = UIAlertView(title: "Success", message: "Sign In", delegate: self, cancelButtonTitle: "OK" )
                        alert.show()
                       self.performSegueWithIdentifier("Explore", sender: self) 
                
                    }else {
                        var alert = UIAlertView(title: "Error", message:
                "\(error)", delegate: self, cancelButtonTitle: "OK" )
                    alert.show()
                
                    }
                
                })
        }
        
    }

    @IBAction func signUpButton(sender: AnyObject) {
        
         
        self.performSegueWithIdentifier("SignUp", sender: self)

    }
    
    
    @IBAction func FaceBookButton(sender: AnyObject) {
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions( self.permission, block:  { (user,   error  ) -> Void in
            if (user == nil) {
                NSLog("user cancel")
                
                
                
            } else if user!.isNew {
                NSLog("user signed up and log in through facebook! \(user)")
                
            }else {
                NSLog("user sign in through facebook! \(user)")
                // self.performSegueWithIdentifier("SignUp", sender: self)
                
            }
            self.performSegueWithIdentifier("Explore", sender: self)
            
        })
    
    }
}

