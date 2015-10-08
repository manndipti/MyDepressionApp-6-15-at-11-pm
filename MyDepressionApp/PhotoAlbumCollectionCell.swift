
//
//  PhotoGallleryCollectionViewCell.swift
//  MyDepressionApp
//
//  Created by student on 6/7/15.
//  Copyright (c) 2015 Mayur. All rights reserved.
//

import UIKit


class PhotoAlbumCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    func setThubnailImage(thabnailImage: UIImage){
        self.imageView.image = thabnailImage
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selected = false
    }
    
    override  var selected : Bool {
        didSet {
            self.backgroundColor = selected ? themeColor: UIColor.blackColor()
        }
    }
}