//
//  AppDelegate.swift
//  sway
//
//  Created by Joshua Paulsen on 9/12/18.
//  Copyright © 2018 Joshua Paulsen. All rights reserved.
//

import UIKit
import UserNotifications


let loginViewController: LoginViewController = LoginViewController()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
   
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        PPManager.sharedInstance.addUserListener(handler:loginViewController.userListener(_:_:))
        PPManager.sharedInstance.configure(env:env, clientId:cid, secret:cse, andRedirectURI:redirectURI)
        
        return true
    }
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        PPManager.sharedInstance.handleOpenURL(url:url)
        return true
    }
    
}
