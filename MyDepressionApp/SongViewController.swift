//
//  MainViewController.swift
//  MySongs
//
//  Created by Dipti Sharma on 6/4/15.
//  Copyright (c) 2015 Dipti Sharma. All rights reserved.
//

import Foundation

import UIKit

class MainViewController: UIViewController {
    
    
    
    @IBAction func playButton(sender: AnyObject) {
        
        AudioPlayer.play()
        
    }
    
    
    @IBAction func pauseButton(sender: AnyObject) {
        
        AudioPlayer.pause()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}