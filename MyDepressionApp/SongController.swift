//
//  SongController.swift
//  MyDepressionApp
//
//  Created by student on 6/10/15.
//  Copyright (c) 2015 Mayur. All rights reserved.
//

import UIKit

class SongController: UIViewController {

    @IBOutlet weak var pauseButton: UIBarButtonItem!
    @IBOutlet weak var playButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func play(sender: AnyObject) {
        AudioPlayer.play()
        playButton.enabled = false
        pauseButton.enabled = true
        
    }
    
    @IBAction func pause(sender: AnyObject) {
        AudioPlayer.pause()
        playButton.enabled = true
        pauseButton.enabled = false

    }

}
