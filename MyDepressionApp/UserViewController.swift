//
//  UserViewController.swift
//  MyDepressionApp
//
//  Created by student on 6/7/15.
//  Copyright (c) 2015 Mayur. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class UserViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    var signInController: PFLogInViewController! = PFLogInViewController()
    var singUpController: PFSignUpViewController!    =  PFSignUpViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if PFUser.currentUser() != nil {
          // self.navigationController?.popViewControllerAnimated(true)
            self.signInController.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.LogInButton | PFLogInFields.SignUpButton | PFLogInFields.DismissButton
            var logInTitle = UILabel()
            logInTitle.text = "Depression Appilcation"
            self.signInController.logInView?.logo = logInTitle
            self.signInController.delegate = self
            
            var SignUpTitle = UILabel()
            SignUpTitle.text = "Depression Appilcation"
            self.singUpController.signUpView?.logo = SignUpTitle
            self.singUpController.delegate = self
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
        if !username.isEmpty || !password.isEmpty  {
            return true
        }else{
            return false
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        println("failed logIn")
    }
    
    
    func logInViewControllerDidCancelLogIn(logInController: PFLogInViewController) {
        println("cancel")
    
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        println("Fail signup")
    }
    
   /* func signUpViewController(signUpController: PFSignUpViewController, shouldBeginSignUp info: [NSObject : AnyObject]) -> Bool {
        <#code#>
    }*/
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        println("user dismiss")
    }
    
    @IBAction func UserAction(sende: AnyObject) {
        
        let currentUser =  PFUser.currentUser()
        if (currentUser != nil)  {
            self.performSegueWithIdentifier("Explore1", sender: self)

        }else {
            self.performSegueWithIdentifier("SignIn", sender: self)

        }
    }
    
  
    
    
    @IBAction func ExploreButton(sender: AnyObject) {
        self.performSegueWithIdentifier("Explore1", sender: self)
    }
    
    

}

