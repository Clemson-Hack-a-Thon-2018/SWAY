//
//  LoginViewController.swift
//  sway
//
//  Created by Joshua Paulsen on 9/13/18.
//  Copyright © 2018 Joshua Paulsen. All rights reserved.
//

import UIKit

@objc class LoginViewController: UIViewController{
    
    func userListener(_ user:PPUserObject?, _ authd:Bool) -> Void {
        print("userListener invoked");
        if(!authd) {
            let sb:UIStoryboard = UIStoryboard.init(name:"Main", bundle:nil)
            let vc:LoginViewController = sb.instantiateViewController(withIdentifier:"LoginViewController") as! LoginViewController
            vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal;
            
            let loginButton:PPLoginButton = PPLoginButton.init()
            loginButton.center = self.view.center
            vc.view.addSubview(loginButton)
            //                self.present(vc, animated:true, completion:nil)
            
            let pos = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY - 80)
            loginButton.center = pos
            
            guard let rvc:UIViewController = UIApplication.shared.keyWindow?.rootViewController else {
                return
            }
            
            //                  guard let rvc = self.window?.rootViewController else {
            //                    return
            //                }
            
            if let cvc = getCurrentViewController(rvc) {
                cvc.present(vc, animated:true, completion:nil)
            }
            
        } else {
            
            guard let rvc:UIViewController = UIApplication.shared.keyWindow?.rootViewController else {
                return
            }
            
            let sb: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let vc:Profile = sb.instantiateViewController(withIdentifier: "Profile") as! Profile
            vc.user = user
            vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal;
            
            if let cvc = getCurrentViewController(rvc) {
                cvc.present(vc, animated:true, completion:nil)
            }
            
        }
        
        func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            //        PPManager.sharedInstance().PPusersvc.addUserListener((userListener: user, error) -> () {
            /*
             PPManager.sharedInstance().PPusersvc.addUserListener { user, error
             //            self.submitTokenToBackend {token, error in
             if (error != nil) {
             print("error: \(error!)")
             } else {
             print("username: \(user.handle)")
             let sb:UIStoryboard = UIStoryboard.init(name:"Main", bundle:nil);
             let vc:UIViewController = sb.instantiateViewController(withIdentifier:"userViewController");
             vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal;
             self.present(vc, animated:true, completion:nil)
             }
             });
             */
            
            //PPLoginButton handles all auth flow
            // let loginButton:PPLoginButton = PPLoginButton.init()
            
            //Styling
            
            
            
            
            //   self.view.addSubview(loginButton)
            
            
        }
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        /*
         func didTouchAnonymous() -> (IBAction) {
         let now: NSDate = NSDate.init();
         let age12:NSDate = self.logicalOneYearAgo(now)
         PPManager.sharedInstance().PPusersvc.loginAnonymously(age12);
         }
         
         func logicalOneYearAgo(from: NSDate) -> NSDate {
         let gregorian:NSCalendar = NSCalendar.initWithCalendarIdentifier(NSCalendarIdentifierGregorian);
         let offsetComponents:NSDateComponents = NSDateComponents.init();
         offsetComponents.setYear(-1);
         return gregorian.dateByAddingComponents(offsetComponents, toDate(from options:0));
         */
        
        
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
}
