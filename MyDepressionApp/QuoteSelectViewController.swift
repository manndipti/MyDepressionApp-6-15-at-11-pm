
//
//  QuoteSelectViewController.swift
//  MyDepressionApp
//
//  Created by student on 6/12/15.
//  Copyright (c) 2015 Mayur. All rights reserved.
//

import UIKit

var carImages = [String]()

class QuoteSelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Motivational(sender: AnyObject) {
        
        carImages = ["Motivational.jpg", "Motivational1.jpg","Motivational2.jpg", "Motivational3.jpg", "Motivational4,.jpg","Motivational5.jpg","Motivational6.jpg", "Motivational7.jpg", "Motivational8.jpg","Motivational9.jpg","Motivational10.jpg.png","Motivational11.jpg","Motivational12.jpg", "Motivational13.jpg" ]
        self.performSegueWithIdentifier("Connect", sender: self)
    }

    
    @IBAction func Family(sender: AnyObject) {
        carImages = ["Family.jpg"]
        self.performSegueWithIdentifier("Connect", sender: self)
    }

    @IBAction func Love(sender: AnyObject) {
       carImages = ["Love.jpg","Love1.jpg","Love2.jpg","Love3.jpg","Love4.jpg"]
        self.performSegueWithIdentifier("Connect", sender: self)
    }
    
    @IBAction func Life(sender: AnyObject) {
         carImages = ["life.jpg", "life1.jpg", "Life2.jpg","life3.jpg", "Life4.jpg"]
        
        self.performSegueWithIdentifier("Connect", sender: self)
    }
    
    
    @IBAction func More(sender: AnyObject) {
        carImages = ["More.jpg","More1.jpg","More2.jpg", "More3.jpg", "More4.jpg", "More5.jpg"]
        self.performSegueWithIdentifier("Connect", sender: self)
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
