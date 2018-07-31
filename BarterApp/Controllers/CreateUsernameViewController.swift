//
//  CreateUsernameViewController.swift
//  BarterApp
//
//  Created by Anna Pawl on 7/25/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase


class CreateUsernameViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty else { return }
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else { return }
            
             User.setCurrent(user)
            
            let initialViewController = UIStoryboard.initialViewController(for: .home)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        
            print("Created new user: \(user.username)")
        }
    }

//
//
//        UserService.create(firUser, username: username) { (user) in
//            guard let user = user else { return }
//
//            print("Created new user: \(user.username)")
//This is supposed to be in appDelegate?
//            let storyboard = UIStoryboard(name: "Home", bundle: .main)
//            if let initialViewController = storyboard.instantiateInitialViewController() {
//                self.view.window?.rootViewController = initialViewController
//                self.view.window?.makeKeyAndVisible()
//            }
//        }
    
        }

