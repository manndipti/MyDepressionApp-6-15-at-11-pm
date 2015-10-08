//
//  AppDelegate.swift
//  MyDepressionApp
//
//  Created by student on 6/6/15.
//  Copyright (c) 2015 Mayur. All rights reserved.
//

import UIKit
import Parse

let themeColor = UIColor(red: 0.01, green: 0.41, blue: 0.22, alpha: 1.0)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window?.tintColor = themeColor
        UINavigationBar.appearance().barTintColor = UIColor(red: 185.0/255.0, green: 231.0/255.0, blue: 132.0/255.0, alpha: 1.0)

        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        // Override point for customization after application launch.
        Parse.setApplicationId("TMi5KkjAjQ5s1kfm4KaLuGehpNbGDTO8vVQlkSD7", clientKey: "tieESfKi9z3qFSAZFwZAG9UdWEAkC8lHQDUNnbDm")
        
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
      
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application( application: UIApplication,
        openUrl url: NSURL,
        sourceApplication: String?,
        annotation: AnyObject?) -> Bool {
            return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }

}

