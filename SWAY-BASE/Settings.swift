//Joshua Paulseb
import UIKit

class SettingsTableTableViewController: UITableViewController {
    
    // Connect these
    
    /*
    @IBOutlet weak var cell1: UITableViewCell!
    
    @IBOutlet weak var cell2: UITableViewCell!
    
    @IBOutlet weak var cell1Header: UITableViewCell!
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        // Uncomment when conneceted 
        /*
        cell1.textLabel!.text = "Privacy Policy"
        
        cell2.textLabel!.text = "Manage playPORTAL Account"
        */
        
        self.tableView.tableFooterView = UIView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Privacy"
        case 1:
            return "Account"
        default :
            return "No Header"
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch (indexPath.section, indexPath.row) {
        case (0,0) :
            self.performSegue(withIdentifier: "privacyPolicy", sender: self)
            self.tableView.deselectRow(at: IndexPath(row: 0, section: 0), animated: true)
            print("Privacy Policy")
        case (1,0) :
            self.tableView.deselectRow(at: IndexPath(row: 0, section: 1), animated: true)
            print("Manage Account")
            Utils.openOrDownloadPlayPortal()
        default:
            print("Default")
            
        }
    }
}
