//
//  ProfileViewController.swift
//  SocialLogins
//
//  Created by Sridatta Nallamilli on 21/01/20.
//  Copyright © 2020 Sridatta Nallamilli. All rights reserved.
//

import UIKit
import SDWebImage
import GoogleSignIn

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var userIDLbl: UILabel!
    
    @IBOutlet var logoutBtn: UIButton!
    
    var userModel:UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = userModel {
            nameLbl.text = user.name
            emailLbl.text = user.email
            userIDLbl.text = user.userid
            profileImg?.sd_setImage(with: user.imageUrl, completed: nil)
        }
        else {
            print("User Model Not Found")
        }
        
    }
    
    @IBAction func didTapLogout(_ sender: AnyObject) {
        GIDSignIn.sharedInstance()?.signOut()
//        let vc = self.storyboard?.instantiateViewController(identifier: "VC") as! ViewController
        self.navigationController?.popViewController(animated: true)
//        self.present(vc, animated: true, completion: nil)
    }


}
