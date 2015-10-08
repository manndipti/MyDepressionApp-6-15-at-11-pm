//
//  QuestionDetailViewController.swift
//  QuestonApp
//
//  Created by student on 6/15/15.
//  Copyright (c) 2015 Mayur. All rights reserved.
//

import UIKit

class QuestionDetailViewController: UIViewController {

    @IBOutlet weak var DetailImageView:
    UIImageView!
    
    var image: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.DetailImageView.image = UIImage(named: image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
      //  self.navigationController?.hidesBarsOnTap = true
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
