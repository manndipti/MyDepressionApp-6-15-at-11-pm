//
//  QuestionTableViewController.swift
//  
//
//  Created by student on 6/15/15.
//
//

import UIKit

class QuestionTableViewController: UITableViewController {
    
    var data = Data()

    override func viewDidLoad() {
        super.viewDidLoad()
 self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        
             }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.Questions.count
        
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! QuestionTableViewCell

        let index = data.Questions[indexPath.row]
 
        cell.textLabel?.text = index.heading
        
        
        return cell
    }
    
 
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var dstCtrl :  QuestionDetailViewController = segue.destinationViewController as! QuestionDetailViewController
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow(){
                
                
                var index = data.Questions[indexPath.row]
            
                
                dstCtrl.image = index.fileName
                
            }
        }

       
    }
    

}
