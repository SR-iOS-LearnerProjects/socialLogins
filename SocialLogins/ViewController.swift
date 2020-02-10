//
//  ViewController.swift
//  SocialLogins
//
//  Created by Sridatta Nallamilli on 21/01/20.
//  Copyright © 2020 Sridatta Nallamilli. All rights reserved.
//

import UIKit
import GoogleSignIn
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet var fbBtn: UIButton!
    @IBOutlet var googleBtn: UIButton!
    @IBOutlet var emailBtn: UIButton!
    
//    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didTapFacebook(_ sender: AnyObject) {

    }
    
    @IBAction func didTapGoogle(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @IBAction func didTapEmail(_ sender: AnyObject) {
        
    }

}

extension ViewController: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print(error.debugDescription)
        }
        else {
            if let user = user {
                let userModel = UserModel(
                    name: user.profile.name,
                    email: user.profile.email,
                    userid: user.userID,
                    imageUrl: user.profile.imageURL(withDimension: UInt(200))
                )
                let pvc = self.storyboard?.instantiateViewController(identifier: "ProfileVC") as! ProfileViewController
                pvc.userModel = userModel
                self.navigationController?.pushViewController(pvc, animated: true)
//                self.present(pvc, animated: true, completion: nil)
            }
        }
    }
    
    
}

