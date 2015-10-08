//
//  data.swift
//  QuestonApp
//
//  Created by student on 6/15/15.
//  Copyright (c) 2015 Mayur. All rights reserved.
//

import Foundation

class Data {
    
    
    class Entry {
        let fileName: String
        let heading: String
        
     
   init(fname: String, heading: String){
            self.fileName = fname
            self.heading = heading
        }
        
    }
    let Questions = [
    Entry(fname: "CausesOfDepression.jpg", heading: "Depressions Cycle"),
    Entry(fname: "WhatIsDepression.jpg", heading: "How To Manage Depressions")
    

    ]}