//
//  FlickrPhotoCell.swift
//  FlickrSearch
//
//  Created by Dipti Sharma on 6/7/15.
//  Copyright (c) 2015 Dipti Sharma. All rights reserved.
//

import UIKit

class FlickrPhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selected = false
    }
    
    override var selected : Bool {
        didSet {
            self.backgroundColor = selected ? themeColor : UIColor.blackColor()
        }
    }
}
