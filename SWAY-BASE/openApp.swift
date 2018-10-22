//
//  openApp.swift
//  SWAY
//
//  Created by Joshua Paulsen on 10/22/18.
//  Copyright © 2018 Phill Farrugia. All rights reserved.
//

import Foundation
import UIKit
import StoreKit

public class openApp {
    static func openOrDownloadPlayPortal() {
        
        let storeProductVC = SKStoreProductViewController()
        let playPortalURL = URL(string: "playportal://")!
        
        
        if UIApplication.shared.canOpenURL(playPortalURL) {
            UIApplication.shared.openURL(playPortalURL)
        }
        else {
            print("Cannot Open")
        }
    }
}
