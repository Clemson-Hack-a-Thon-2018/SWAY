//
//  PPUserService.swift
//  Helloworld-Swift-SDK
//
//  Created by Gary J. Baldwin on 9/15/18.
//  Copyright © 2018 Gary J. Baldwin. All rights reserved.
//

import Foundation

import Foundation
import UIKit
import QuartzCore
import SafariServices
import Alamofire
import KeychainSwift

typealias PPUserCompletion = (_ succeeded: Bool, _ response: Any?, _ responseObject: PPUserObject?) -> Void
typealias PPImageCompletion = (_ succeeded: Bool, _ response: Any?, _ responseObject: UIImage?) -> Void
typealias PPFriendsCompletion = (_ succeeded: Bool, _ response: Any?, _ responseObject: [PPUserObject]?) -> Void

class PPUserObject {
    // This class maintains 2 dictionaries for the user. One dictionary, "u" has strings the other "uPics" has the user's profile and cover images
    
    // "u" Contains one or more of (as Strings)
    // { userId, handle, firstName, lastName, country, accountType, userType, parentFlags, profilePicId, coverPhotoId, myAge }
    var u: [String : String]
    
    // Contains one or more of (as UIImage)  where key is in { "profilePic", "coverPic" }
    var uPics: [String: UIImage]
    
    init() {
        u = [:]
        uPics = [:]
    }
    
    func setImage(value:UIImage, key:String) -> Void {
        uPics.updateValue(value as UIImage, forKey: key)
    }
    func getImage(key:String) -> UIImage? {
        if let img = uPics[key] {
            return img
        }
        return nil
    }
    
    func set(value:String, key:String) -> Void {
        u.updateValue(value, forKey: key)
    }
    func get(key:String) -> String? {
        if let v = u[key] {
            return v
        }
        return nil
    }
    
}


class PPUserService {
    // This class provides all user & friend SDK i/f.  It maintains 2 dictionaries for the user. One dictionary, "u" has strings
    // for the basic user profile, the other is UIImages "uPics" has the user's profile and cover images

    var user: PPUserObject // contains all user fields and images (if downloaded)
    var userProfileIsValid: Bool
    var isAnonymousUser: Bool?
    
    var myFriends: [PPUserObject] // Array of PPUserObjects
    
//    init(keychain:KeychainWrapper) {
    init(keychain:KeychainSwift) {
        userProfileIsValid = false
        user = PPUserObject()  // user data is contained in the userObject
        
        if let v = keychain.get("handle") { user.set(value:v, key:"handle") }
        if let v = keychain.get("userId") { user.set(value:v, key:"userId") }
        if let v = keychain.get("userType") { user.set(value:v, key:"userType") }
        if let v = keychain.get("firstName") { user.set(value:v, key:"firstName") }
        if let v = keychain.get("lastName") { user.set(value:v, key:"lastName") }
        if let v = keychain.get("county") { user.set(value:v, key:"country") }
        if let v = keychain.get("accountType") { user.set(value:v, key:"accountType") }
        if let v = keychain.get("userType") { user.set(value:v, key:"userType") }
        if let v = keychain.get("profilePicId") { user.set(value:v, key:"profilePicId") }
        if let v = keychain.get("coverPhotoId") { user.set(value:v, key:"coverPhotoId") }
        if let v = keychain.get("myAge") { user.set(value:v, key:"myAge") }

        isAnonymousUser = false
        myFriends = []
    }
    
    // ----------------------------------------------------------------
    // user methods
    // ----------------------------------------------------------------
    // If user isn't currently authenticated with server, then perform oauth login
    func login() -> Void {
        let pre: String = PPManager.sharedInstance.getApiUrlBase()
        let slug: String =  "/oauth/signin?client_id="
        let cid: String = PPManager.sharedInstance.getClientId()
        let mid: String = "&redirect_uri="
        let uri: String = PPManager.sharedInstance.getRedirectURI()
        let post: String = "&state=beans&response_type=implicit"
        
        let url: String = pre + slug + cid + mid + uri + post
        print("Login url: \(url)")
 
        let _svc = SFSafariViewController(url: NSURL(string: url)! as URL)
        _svc.modalTransitionStyle = UIModalTransitionStyle.coverVertical

        var topController:UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!;
        }
        
        topController.present(_svc, animated:true, completion:nil)
    }  
    
    
    func loginAnonymously(birthdate: NSDate) -> Void {
//        NSLog(@"%@ app user logging in anonymously...", NSStringFromSelector(_cmd));
/*
        let urlString:String = PPManager.sharedInstance.apiUrlBase + "/user/v1/my/profile"
        PPManager.sharedInstance.setImAnonymousStatus(true)
    

    NSDictionary *body = @{@"anonymous":@"TRUE", @"dateOfBirth": [PPManager stringFromNSDate:birthdate], @"clientId":[PPManager sharedInstance].clientId, @"deviceToken": [[PPManager sharedInstance] getDeviceToken]};
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:body options:0 error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSMutableURLRequest *req = [PPManager buildAFRequestForBodyParms: @"PUT" andUrlString:urlString];
    [req setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
    if (!error) {
    NSDictionary *dictionary = [(NSHTTPURLResponse*)response allHeaderFields]; // Capture accessToken and refreshToken from header
    [[PPManager sharedInstance] extractAndSaveTokens:dictionary];
    NSLog(@"%@ response: %@", NSStringFromSelector(_cmd), dictionary);
    NSLog(@"%@ Reply JSON: %@", NSStringFromSelector(_cmd), responseObject);
    
    NSDictionary *user = [[NSMutableDictionary alloc]initWithDictionary:responseObject];
    [[PPManager sharedInstance].PPuserobj inflateWith:user];
    
    [[PPManager sharedInstance].PPdatasvc openBucket:[PPManager sharedInstance].PPuserobj.myDataStorage andUsers:(NSArray *)[NSArray arrayWithObjects:[PPManager sharedInstance].PPuserobj.userId, nil] public:@"FALSE" handler:^(NSError* error) {
    if(error) {
    NSLog(@"%@ Error: Unable to open/create user bucket - %@", NSStringFromSelector(_cmd), error);
    [PPManager sharedInstance].PPusersvc.addUserListener(NULL, error);
    } else {
    NSLog(@"%@ Open/create user bucket for user: %@", NSStringFromSelector(_cmd), user);
    }
    }];
    } else {
    [PPManager processAFError:error withRetryBlock:NULL];
    NSLog(@"%@ Error %@ %@ %@", NSStringFromSelector(_cmd), error, response, responseObject);
    [PPManager sharedInstance].PPusersvc.addUserListener(NULL, error);
    }
    }] resume];
*/
 }
    
    
   func logout() -> Void {
        PPManager.sharedInstance.logout()
   }
    
    func getProfile(completion: @escaping PPUserCompletion ) {
        if(userProfileIsValid) {
            completion(true, nil, user)
        } else {
            // get user profile from server
            PPManager.sharedInstance.PPwebapi.getUserProfile{ succeeded, response, responseObject in
                print("userprofile read from server:")
                if(succeeded) {
                    self.user.u = responseObject as! [String:String]
                    self.userProfileIsValid = true
                    completion(true, response, self.user)
                } else {
                    completion(false, nil, nil)
                }
            }
        }
    }


    func getAppNameFromBundle() -> String {
        let items = Bundle.main.bundleIdentifier!.split(separator: ".")
        return String(items.last!)
    }
    
    func getMyDataStorageName() -> String {
        if let h:String = user.get(key: "handle") {
            return h + "@" + getAppNameFromBundle()
        } else {
            return nil!
        }
    }
    
    func getMyAppGlobalDataStorageName() -> String {
        return getAppNameFromBundle() + "@globalAppData"
    }
    

    func getProfilePic(completion: @escaping PPImageCompletion ) {
        if let img:UIImage = user.getImage(key:"profilePic") {
            completion(true, nil, img)
        } else {
            PPManager.sharedInstance.PPwebapi.getProfileOrCoverImage(isProfile: true) { succeeded, response, responseObject in
                print("getProfilePic from server:")
                    if(succeeded) {
                        self.user.uPics["profilePic"] = responseObject as? UIImage
                        completion(true, nil, self.user.uPics["profilePic"])
                    }
                }
            }
        completion(true, nil, UIImage(named: "anonUser"))
    }
        
    func getCoverPic(completion: @escaping PPImageCompletion ) {
        if let img:UIImage = user.getImage(key:"coverPic") {
            completion(true, nil, img)
        } else {
            PPManager.sharedInstance.PPwebapi.getProfileOrCoverImage(isProfile: true) { succeeded, response, responseObject in
                print("getCoverPic from server:")
                if(succeeded) {
                    self.user.uPics["profilePic"] = responseObject as? UIImage
                    completion(true, nil, self.user.uPics["coverPic"])
                }
            }
        }
        completion(true, nil, UIImage(named: "anonUserCover"))
    }
    
    
    // ----------------------------------------------------------------
    // Friends methods
    // ----------------------------------------------------------------
    func getFriendsProfiles(completion: @escaping PPFriendsCompletion ) {
        PPManager.sharedInstance.PPwebapi.getFriendsProfiles{ succeeded, response, responseObject in
            print("friendsprofiles read from server:")
            if(succeeded) {
                self.myFriends = responseObject as! [PPUserObject]
                completion(true, response, self.myFriends)
                completion(false, nil, nil)
            } else {
                completion(false, nil, nil)
            }
        }
        completion(false, nil, [])
    }
    
   
    func getFriendsCount() -> Int {
        return myFriends.count
    }
    
    func getFriendsProfilePic(_ friendId: String) -> UIImage? {
        if let f = getFriendById(friendId) {
            if let img:UIImage = f.getImage(key:f.get(key: "profilePicId")!) {
                return img
            }
        }
        return UIImage(named: "anonUser")
    }

    func getFriendById(_ friendId: String) -> PPUserObject? {
        for f in self.myFriends { if f.u["userId"] == friendId { return f } }
        return nil
    }
    func getFriendAtIndex(_ index: NSInteger) -> PPUserObject? {
        if(index < myFriends.count) { return myFriends[index]} else { return nil }

    }
}




