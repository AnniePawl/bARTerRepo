//
//  profileViewController.swift
//  BarterApp
//
//  Created by Anna Pawl on 8/4/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import Firebase

class ProfileViewController : UIViewController {
   // OUTLETS
  
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBAction func editProfileButton(_ sender: Any) {
    }
    

    override func viewDidLoad() {
    super.viewDidLoad()
        
      
        
        profilePic.layer.cornerRadius = 60
        profilePic.clipsToBounds = true
    
               
    }
}
