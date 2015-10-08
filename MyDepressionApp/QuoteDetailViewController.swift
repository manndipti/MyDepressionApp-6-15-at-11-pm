
//
//  QuoteDetailViewController.swift
//  MyDepressionApp
//
//  Created by student on 6/12/15.
//  Copyright (c) 2015 Mayur. All rights reserved.
//

import UIKit

class QuoteDetailViewController: UIViewController {

    @IBOutlet weak var DetailImage: UIImageView!
    
    var name: AnyObject? {
        get{
            return NSUserDefaults.standardUserDefaults().objectForKey("love")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.hidesBarsOnTap = true

        DetailImage.image = UIImage(named: name as! String)
        // Do any additional setup after loading the view.
        //self.DetailImage = imageView.photo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
