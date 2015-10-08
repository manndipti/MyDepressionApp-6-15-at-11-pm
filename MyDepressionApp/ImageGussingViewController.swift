

//
//  ViewController.swift
//  ImageMatching
//
//  Created by Dipti Sharma on 5/27/15.
//  Copyright (c) 2015 Dipti Sharma. All rights reserved.
//

import UIKit

class ImageGussingViewController: UIViewController {
    
    @IBOutlet weak var achieve1: UIButton!
    @IBOutlet weak var achieve2: UIButton!
   
    @IBOutlet weak var believe2: UIButton!
    @IBOutlet weak var believe1: UIButton!
    
    @IBOutlet weak var imagine1: UIButton!
    @IBOutlet weak var imagine2: UIButton!
    
    @IBOutlet weak var imagine: UILabel!
    @IBOutlet weak var believe: UILabel!
    @IBOutlet weak var achieve: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        achieve.hidden = true
        believe.hidden = true
        imagine.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveImage(sender: UIButton, button: UIButton) {
        var rect:CGRect = button.frame
        rect.origin.x = sender.frame.origin.x + 245
        rect.origin.y = sender.frame.origin.y - 250
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            button.frame = rect })
        achieve1.enabled = false
    }
    
    func moveImage1(sender: UIButton, button: UIButton) {
        var rect:CGRect = button.frame
        rect.origin.x = sender.frame.origin.x
        rect.origin.y = sender.frame.origin.y - 250
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            button.frame = rect })
        believe1.enabled = false
    }

    func moveImage2(sender: UIButton, button: UIButton) {
        var rect:CGRect = button.frame
        rect.origin.x = sender.frame.origin.x - 245
        rect.origin.y = sender.frame.origin.y - 250
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            button.frame = rect })
        imagine1.enabled = false
    }
    @IBAction func achieve(sender: UIButton) {
         moveImage(sender, button: self.achieve1)
        achieve.hidden = false
        
    }
    
    @IBAction func believe(sender: UIButton) {
        moveImage1(sender, button: self.believe1)
        believe.hidden = false
    }
    
    @IBAction func imagine(sender: UIButton) {
        moveImage2(sender, button: self.imagine1)
        imagine.hidden = false

    }
   
 /*   @IBAction func btnbelieve(sender: UIButton) {
        
        moveImage(sender, button: self.believe1)
        
    }
    
    
    @IBAction func btnimagine(sender: UIButton) {
        moveImage(sender, button: self.imagine1)
    }
    
    
    @IBAction func btnachieve(sender: UIButton) {
        moveImage(sender, button: self.achieve1)
    }*/

}

