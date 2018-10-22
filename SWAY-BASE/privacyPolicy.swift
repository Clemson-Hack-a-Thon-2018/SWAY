//
//  PrivacyPolicyTableViewController.swift
//  AirTime
//
//  Created by Joshua Paulsen on 9/10/18.
//  Copyright © 2018 kontakt.io. All rights reserved.
//

import Foundation
import UIKit

class PrivacyPolicyViewController : UIViewController {
    
   
    @IBOutlet weak var cell1: UITableViewCell!
    @IBOutlet weak var cell2: UITableViewCell!
    @IBOutlet weak var cell3: UITableViewCell!
    @IBOutlet weak var cell4: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cell1.textLabel!.text = "None"
        
        
        cell2.textLabel!.text = "N/A"
        
        cell3.textLabel!.text = "N/A"
        
        cell4.textLabel!.text = """
        The Rise Collection: Charleston, SC
        """
        
       //self.tableView.tableFooterView = UIView()
        
    }
    /*
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "What Information Is Collected"
        case 1:
            return "Why It Is Collected"
        case 2:
            return "With Whom It Is Shared"
        case 3:
            return "Contact Us"
        default :
            return "No Header"
        }
    }
 */
}
