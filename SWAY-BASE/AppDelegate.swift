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
    
    let cid = "iok-cid-15088a4a71dcffe0b311b6e7fcb48261b527035352d93858"
    let cse = "iok-cse-4e484f0e1333c46428435ff1e75b07e833e4f27d7f397525"
    let redirectURI = "sway://redirect"
    let env = "SANDBOX"
    
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
