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
    
    @IBOutlet weak var P: UILabel!
    @IBOutlet weak var L: UILabel!
    @IBOutlet weak var A: UILabel!
    @IBOutlet weak var Y: UILabel!
    
 
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var profilePicGradient: GradientBkgndView!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       // profilePicGradient.layer.cornerRadius = profilePicGradient.frame.height / 2.0
       // profilePicGradient.clipsToBounds = true
        profilePic.layer.cornerRadius = profilePic.frame.height / 2.0
        
        let h = self.user?.get(key: "handle")
        let fu = self.user?.get(key:"firstName")
        let lu = self.user?.get(key:"lastName")
        if h != nil && fu != nil && lu != nil {
            label.text = h! + " | " + fu! + " " + lu!
       
       /*
            P.font = UIFont(name: "Scribble Box DEMO", size: 23)
            L.font = UIFont(name: "Scribble Box DEMO", size: 23)
            A.font = UIFont(name: "Scribble Box DEMO", size: 23)
            Y.font = UIFont(name: "Scribble Box DEMO", size: 23)
        */
        /*
        // Logout
        
        
        @IBAction func logout(_ sender: Any) {
            //    func logoutTapped() {
            PPManager.sharedInstance.logout()
            //        self.dismiss(animated: true, completion: nil)
        }
        */
        
        // name label
    
        //nameLabel?.text = (self.user!.get(key:"firstName"))
        
        //nameLabel?.adjustsFontSizeToFitWidth = true
        
        //handle label
        
        //handleLabel.text = self.user?.get(key:"handle")
        
        // user pictures
        
        PPManager.sharedInstance.PPusersvc.getProfilePic { succeeded, response, img in
            self.profilePic?.image = img
            }
        }
    }
}
