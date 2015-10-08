//
//  SignInViewController.swift
//  
//
//  Created by student on 6/7/15.
//
//


import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0,150,150)) as UIActivityIndicatorView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        
        view.addSubview(self.actInd)
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignUpButon(sender: AnyObject) {
        var userName = self.userName.text
        var password = self.password.text
        var email = self.email.text
        
        if count(userName ) < 4 || count(password) < 6   {
            var alert = UIAlertView(title: "Invalid", message: "UserName has to be more than 4 character and password should be 6 or more character long", delegate: self, cancelButtonTitle: "OK" )
            alert.show()
            
        }else if count(email) < 8 {
            var alert = UIAlertView(title: "Invalid", message: "Please Enter a valid Email address", delegate: self, cancelButtonTitle: "OK" )
            alert.show()
        }else {
            
            self.actInd.startAnimating()
            var newUser = PFUser()
            newUser.username = userName
            newUser.password = password
            newUser.email = email
            
            newUser.signUpInBackgroundWithBlock( { (success, error) -> Void in
                
                self.actInd.stopAnimating()
                
                if error != nil {
                    var alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK" )
                    alert.show()
                }else {
                    var alert = UIAlertView(title: "Success", message: "Signed Up", delegate: self, cancelButtonTitle: "OK" )
                    alert.show()
                   self.performSegueWithIdentifier("Explore2", sender: self)
                    


                }
                
            })
            
            
            
        }
    }

    

}
