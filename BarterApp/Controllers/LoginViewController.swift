//
//  LoginViewController.swift
//  BarterApp
//
//  Created by Anna Pawl on 7/24/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase

//to handle future namespace conflicts
//will now use "FIRUser" instead of "User" to refer to FirebaseAuth.user

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    @IBAction func loginRegister(_ sender: UIButton) {
        print("button pressed")
                    guard let authUI = FUIAuth.defaultAuthUI()
                    else { return }
                authUI.delegate = self
        
                let authViewController = authUI.authViewController()
                present(authViewController, animated: true)
        }
}


extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        guard let user = authDataResult?.user
            else { return }

        let userRef = Database.database().reference().child("users").child(user.uid)
        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
            if let user = User(snapshot: snapshot) {
                 User.setCurrent(user, writeToUserDefaults: true)
                let initialViewController = UIStoryboard.initialViewController(for: .home)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
                
            } else {
                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
                print("New user!")
                }
        })
    }
}



