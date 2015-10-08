//
//  MyCollectionViewController.swift
//  CollectionDemo
//
//  Created by Dipti Sharma on 6/8/15.
//  Copyright (c) 2015 Dipti Sharma. All rights reserved.
//

import UIKit

let reuseIdentifier = "MyCell"

class QCollectionViewController: UICollectionViewController {
    
    var name: AnyObject? {
        get{
            return NSUserDefaults.standardUserDefaults().objectForKey("love")
        }
        set{
            
            NSUserDefaults.standardUserDefaults().setObject(newValue!, forKey: "love")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* carImages = ["Motivational.jpg", "Motivational1.jpg","Motivational2.jpg", "Motivational3.jpg", "Motivational4,.jpg","Motivational5.jpg","Motivational6.jpg", "Motivational7.jpg", "Motivational8.jpg","Motivational9.jpg","Motivational10.jpg.png","Motivational11.jpg","Motivational12.jpg", "Motivational13.jpg" ]*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return carImages.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCell", forIndexPath: indexPath) as! QCollectionViewCell
        
        // Configure the cell
        let image = UIImage(named: carImages[indexPath.row])
        
        cell.imageView.image = image
        
        return cell
    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        name =  carImages[indexPath.row]
    }
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "DetailView" {
    let index: NSIndexPath = self.collectionView?.indexPathsForSelectedItems()
    let dstCtrl  = segue.destinationViewController as!  QuoteDetailViewController
    
    
    let photo = carImages[indexPath.row] as! String
    dstCtrl.photo = photo
    }
    
    }*/
    
    
    
}
