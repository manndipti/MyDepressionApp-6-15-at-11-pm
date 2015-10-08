//
//  ViewController.swift
//  musicApp
//
//  Created by Dipti Sharma on 6/3/15.
//  Copyright (c) 2015 Dipti Sharma. All rights reserved.
//

import UIKit
import Parse
import AVFoundation
import AVKit

public var AudioPlayer = AVPlayer()

public var SelectedSongNumber = Int()

class TableViewController: UITableViewController, AVAudioPlayerDelegate {
    
    var iDArray = [String]()
    
    
    var NameArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var ObjectIDQuery = PFQuery(className: "Song")
        
        ObjectIDQuery.findObjectsInBackgroundWithBlock ({
            (objectsArray : [AnyObject]?, error: NSError?) -> Void in
            
            var objectIDs = objectsArray as! [PFObject]
            
            for i in 0...objectIDs.count-1 {
                self.iDArray.append(objectIDs[i].valueForKey("objectId") as! String)
                
              self.NameArray.append(objectIDs[i].valueForKey("songName") as! String)
                
               
                self.tableView.reloadData()
            
            }
            })
    }
    
    func grabSong(){
        var SongQuery = PFQuery(className: "Song")
        SongQuery.getObjectInBackgroundWithId(iDArray[SelectedSongNumber], block: {
            
        
            (object: PFObject?, error: NSError?) -> Void in
            
            if let AudioFileURLTemp = object?.objectForKey("songFile")?.url {
                AudioPlayer = AVPlayer(URL: NSURL(string: AudioFileURLTemp!))
                AudioPlayer.play()
            }
       
        
        })
        
        
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iDArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        cell.textLabel?.text = NameArray[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        SelectedSongNumber = indexPath.row
        grabSong()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

