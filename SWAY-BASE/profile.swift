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
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // name label
        
         nameLabel.text = (self.user?.get(key:"firstName"))! + " " + (self.user?.get(key: "lastName"))!
        
         nameLabel.adjustsFontSizeToFitWidth = true
        
        
    }
}
