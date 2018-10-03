//
//  profile.swift
//  SWAY
//
//  Created by Joshua Paulsen on 10/1/18.
//  Copyright © 2018 Phill Farrugia. All rights reserved.
//

import Foundation
import UIKit

class Profile : ViewController {
    var user:PPUserObject? = nil;
    
    @IBOutlet weak var coverPic: UIImageView!
    @IBOutlet weak var profilePic: UIImageView?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var handleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*
        // Logout
        
        
        @IBAction func logout(_ sender: Any) {
            //    func logoutTapped() {
            PPManager.sharedInstance.logout()
            //        self.dismiss(animated: true, completion: nil)
        }
        */
        
        // name label
    
        nameLabel?.text = (self.user?.get(key:"firstName"))! + " " + (self.user?.get(key: "lastName"))!
        
        nameLabel?.adjustsFontSizeToFitWidth = true
        
        //handle label
        
         handleLabel.text = self.user?.get(key:"handle")
        
        // user pictures
        
        PPManager.sharedInstance.PPusersvc.getProfilePic { succeeded, response, img in
            self.profilePic?.image = img
        }
        
        PPManager.sharedInstance.PPusersvc.getCoverPic { succeeded, response, img in
            self.coverPic?.image = img
        }
        
    }
}
