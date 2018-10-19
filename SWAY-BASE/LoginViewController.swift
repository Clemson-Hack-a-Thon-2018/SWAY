//
//  LoginViewController.swift
//  sway
//
//  Created by Joshua Paulsen on 9/13/18.
//  Copyright © 2018 Joshua Paulsen. All rights reserved.
//

// Get refrence to profile view controller

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
            
            let pos = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY - 80)
            loginButton.center = pos
            
            guard let rvc:UIViewController = UIApplication.shared.keyWindow?.rootViewController else {
                return
            }
            
            if let cvc = getCurrentViewController(rvc) {
                cvc.present(vc, animated:true, completion:nil)
            }
            
        } else {
            
            guard let rvc:UIViewController = UIApplication.shared.keyWindow?.rootViewController else {
                return
            }
            
            
            let sb: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let vc = sb.instantiateViewController(withIdentifier: "Home") as! UITabBarController
            guard let profile = vc.viewControllers?[2] as? Profile else {
                return
            }
            profile.user = user
            vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal;
            if let cvc = getCurrentViewController(rvc) {
                cvc.present(vc, animated:true, completion:nil)
 
            }
            
        }
        
     func viewDidLoad() {
            super.viewDidLoad()
        }
        
     func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    }

}
