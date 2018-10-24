//
//  profile.swift
//  SWAY
//
//  Created by Joshua Paulsen on 10/1/18.
//  Copyright © 2018 Phill Farrugia. All rights reserved.
//

import Foundation
import UIKit
import StoreKit

@objc class Profile : UIViewController, SKStoreProductViewControllerDelegate {
    
  // User Object
var user:PPUserObject? = nil;
    
    
  // Logout
    @IBAction func logout(_ sender: Any) {
        func logoutTapped() {
            PPManager.sharedInstance.logout()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
  
    @IBAction func open(_ sender: Any) {
      openApp.openOrDownloadPlayPortal(delegate: self)
    }
    
   //Outlets
    
    @IBOutlet weak var profilePic: UIImageView?
    
    @IBOutlet weak var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePic?.layer.cornerRadius = (profilePic?.frame.height)! / 2.0
   
        let h = self.user?.get(key: "handle")
        let fu = self.user?.get(key:"firstName")
        let lu = self.user?.get(key:"lastName")
        if h != nil && fu != nil && lu != nil {
            
        label?.text = h! + " | " + fu! + " " + lu!
            
            
            //Profile Picture
  
            PPManager.sharedInstance.PPusersvc.getProfilePic { succeeded, response, img in
                self.profilePic?.image = img
            }
        }
    }
    
    
    // Debug Function
    
    func addedUser() {
       
        profilePic?.layer.cornerRadius = (profilePic?.frame.height)! / 2.0
        label?.text = "fdsajfidsaojfidsoa"
        let h = self.user?.get(key: "handle")
        let fu = self.user?.get(key:"firstName")
        let lu = self.user?.get(key:"lastName")
        if h != nil && fu != nil && lu != nil {
            label?.text = h! + " | " + fu! + " " + lu!
            
           //Profile Picture
            
            PPManager.sharedInstance.PPusersvc.getProfilePic { succeeded, response, img in
                self.profilePic?.image = img
                }
            }
        }
    }

