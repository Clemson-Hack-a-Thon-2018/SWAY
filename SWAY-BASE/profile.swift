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
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var profilePicGradient: GradientBkgndView!
    
    
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var handleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePicGradient.layer.cornerRadius = profilePicGradient.frame.height / 2.0
        profilePicGradient.clipsToBounds = true
       
        
        /*
        // Logout
        
        
        @IBAction func logout(_ sender: Any) {
            //    func logoutTapped() {
            PPManager.sharedInstance.logout()
            //        self.dismiss(animated: true, completion: nil)
        }
        */
        
        // name label
    
     //   nameLabel?.text = (self.user!.get(key:"firstName"))
        
        nameLabel?.adjustsFontSizeToFitWidth = true
        
        //handle label
        
         handleLabel.text = self.user?.get(key:"handle")
        
        // user pictures
        
        PPManager.sharedInstance.PPusersvc.getProfilePic { succeeded, response, img in
            self.profilePic?.image = img
        }
    }
}
