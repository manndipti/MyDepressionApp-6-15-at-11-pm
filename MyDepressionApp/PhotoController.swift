//
//  PhotoViewController.swift
//  MyDepressionApp
//
//  Created by student on 6/7/15.
//  Copyright (c) 2015 Mayur. All rights reserved.
//

import UIKit
import Photos

class PhotoController: UIViewController {

    @IBOutlet weak var photoViewImage: UIImageView! = nil
    var assetCollection: PHAssetCollection!
    var photosAsset: PHFetchResult!
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
          self.navigationController?.hidesBarsOnTap = true
        self.displayPhoto()
    }
    
    func displayPhoto() {
        let imageManager = PHImageManager.defaultManager()
        /* let Id = imageManager.requestImageForAsset(self.photosAsset[self.index] as PHAsset, targetSize: PHImageManagerMaximumSize, contentMode: PHImageContentMode.AspectFit, options: nil, resultHandler: {(result:UIImage, info:NSDictionary) in
            self.photoViewImage.image = result
        } ) */
        
    }

     
}
