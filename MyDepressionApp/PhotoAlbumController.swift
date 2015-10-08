//
//
//  PhotoGalleryViewController.swift
//  MyDepressionApp
//
//  Created by student on 6/7/15.
//  Copyright (c) 2015 Mayur. All rights reserved.
//

import UIKit
import Photos

//let albumName = "My App"

 

class PhotoAlbumController: UIViewController ,UITextFieldDelegate , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let identifier = "photoCell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    private var searches = [FlickrSearchResults]()
    private let flickr = Flickr()
    
    func photoForIndexPath(indexPath: NSIndexPath) -> FlickrPhoto {
        return searches[indexPath.section].searchResults[indexPath.row]
    }
 
  @IBOutlet var collectionView: UICollectionView!
    
    
    private var selectedPhotos = [FlickrPhoto]()
    private let shareTextLabel = UILabel()
    
    // to see photo biger
    var largePhotoIndexPath : NSIndexPath? {
        didSet {
            //2
            var indexPaths = [NSIndexPath]()
            if largePhotoIndexPath != nil {
                indexPaths.append(largePhotoIndexPath!)
            }
            if oldValue != nil {
                indexPaths.append(oldValue!)
            }
            //3
            
            collectionView?.performBatchUpdates({
                self.collectionView?.reloadItemsAtIndexPaths(indexPaths)
                return
                }){
                    completed in
                    //4
                    if self.largePhotoIndexPath != nil {
                        self.collectionView?.scrollToItemAtIndexPath(
                            self.largePhotoIndexPath!,
                            atScrollPosition: .CenteredVertically,
                            animated: true)
                    }
            }
        }
    }
    
    func updateSharedPhotoCount() {
        shareTextLabel.textColor = themeColor
        shareTextLabel.text = "\(selectedPhotos.count) photos selected"
        shareTextLabel.sizeToFit()
    }
    
    
    var sharing : Bool = false {
        
        didSet {
            
            collectionView?.allowsMultipleSelection = sharing
            collectionView?.selectItemAtIndexPath(nil, animated: true, scrollPosition: .None)
            selectedPhotos.removeAll(keepCapacity: false)
            
            if sharing && largePhotoIndexPath != nil {
                largePhotoIndexPath = nil
            }
            
            let shareButton =
            self.navigationItem.rightBarButtonItems!.first as! UIBarButtonItem
            if sharing {
                updateSharedPhotoCount()
                let sharingDetailItem = UIBarButtonItem(customView: shareTextLabel)
                navigationItem.setRightBarButtonItems([shareButton,sharingDetailItem], animated: true)
            }
            else {
                navigationItem.setRightBarButtonItems([shareButton], animated: true)
            }
        }
    }
    @IBAction func share(sender: AnyObject) {
        if searches.isEmpty {
            return
        }
        
        if !selectedPhotos.isEmpty {
            println("ass")
            var imageArray = [UIImage]()
            for photo in self.selectedPhotos {
                imageArray.append(photo.thumbnail!)
            }
            
            let shareScreen = UIActivityViewController(activityItems: imageArray, applicationActivities: nil)
            let popover = UIPopoverController(contentViewController: shareScreen)
            popover.presentPopoverFromBarButtonItem(self.navigationItem.rightBarButtonItems!.first as! UIBarButtonItem,
                permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)        }
        
        sharing = !sharing
    }
   
   
    
    //1
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return searches.count
    }
    
    //2
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searches[section].searchResults.count
    }
    
    //3
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //1
        let cell: PhotoAlbumCollectionCell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! PhotoAlbumCollectionCell
        //2
       let photoImage = photoForIndexPath(indexPath)
        let flickrPhoto = photoForIndexPath(indexPath)
//self.navigationController?.hidesBarsOnTap = true
        //1
        cell.activityIndicator.stopAnimating()
         
        //2
        if indexPath != largePhotoIndexPath {
            cell.imageView.image = flickrPhoto.thumbnail
            return cell
        }
        
        //3
        if flickrPhoto.largeImage != nil {
            cell.imageView.image = flickrPhoto.largeImage 
            return cell
        }
        
        //4
        cell.imageView.image = flickrPhoto.thumbnail
        cell.activityIndicator.startAnimating()
        
        //5
        flickrPhoto.loadLargeImage {
            loadedFlickrPhoto, error in
            
            //6
            cell.activityIndicator.stopAnimating()
            
            //7
            if error != nil {
                return
            }
            
            if loadedFlickrPhoto.largeImage == nil {
                return
            }
            
            //8
            if indexPath == self.largePhotoIndexPath {
                if let cell = collectionView.cellForItemAtIndexPath(indexPath) as? PhotoAlbumCollectionCell {
                    cell.imageView.image = loadedFlickrPhoto.largeImage
                }
            }
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            
            let headerView: photoHeaderReusableView! = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "photoHeaderReusableView", forIndexPath: indexPath) as!  photoHeaderReusableView
            
            headerView.label.text = searches[indexPath.section].searchTerm
            
            
            return headerView
        default:
            assert(false, "unexpected element Type")
            
        }
        
    }
    
    func collectionView(collectionView: UICollectionView,
        shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
            if sharing {
                return true
            }
            if largePhotoIndexPath == indexPath {
                largePhotoIndexPath = nil
            }
            else {
                largePhotoIndexPath = indexPath
            }
            return false
    }
    
    func collectionView(collectionView: UICollectionView,
        didSelectItemAtIndexPath indexPath: NSIndexPath) {
            if sharing {
                let photo = photoForIndexPath(indexPath)
                selectedPhotos.append(photo)
                updateSharedPhotoCount()
            }
    }
    
  /*  func collectionView(collectionView: UICollectionView,
        didDeselectItemAtIndexPath indexPath: NSIndexPath) {
            if sharing {
                if let foundIndex = find(selectedPhotos, photoForIndexPath(indexPath)) {
                    selectedPhotos.removeAtIndex(foundIndex)
                    updateSharedPhotoCount()
                }
            }
    }*/
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // 1
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        textField.addSubview(activityIndicator)
        activityIndicator.frame = textField.bounds
        activityIndicator.startAnimating()
        flickr.searchFlickrForTerm(textField.text) {
            results, error in
            
            //2
            activityIndicator.removeFromSuperview()
            if error != nil {
                println("Error searching : \(error)")
            }
            
            if results != nil {
                //3
                println("Found \(results!.searchResults.count) matching \(results!.searchTerm)")
                self.searches.insert(results!, atIndex: 0)
                
                //4
                self.collectionView?.reloadData()
            }
        }
        
        textField.text = nil
        textField.resignFirstResponder()
        return true
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            let flickrPhoto = photoForIndexPath(indexPath)
            
            
            if indexPath == largePhotoIndexPath {
                if var size = flickrPhoto.thumbnail?.size {
                    size.width = 375
                    size.height = 602
                    return size
                }
            }
            
            if var size = flickrPhoto.thumbnail?.size {
                size.width = 105
                size.height = 105
                return size
            }
            return CGSize(width: 105, height: 105)
    }
    var photosAsset: PHFetchResult!
    var assetCollection: PHAssetCollection!

    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "photoCell" {
            var dstCtrl :  PhotoController = segue.destinationViewController as! PhotoController
            let indexPath: NSIndexPath! = self.collectionView.indexPathForCell(sender as! UICollectionViewCell)
            dstCtrl.index = indexPath.item
             dstCtrl.photosAsset =  self.photosAsset
            dstCtrl.assetCollection = self.assetCollection
            
        }
    }

}
