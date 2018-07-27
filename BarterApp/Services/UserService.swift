//
//  UserService.swift
//  BarterApp
//
//  Created by Anna Pawl on 7/26/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//


//This file contains all backend methods related to users. Decoupling networking code into a service layer so I can switch to another backend w/o changing view controllers. Removing networking code, like reading and writing to our database, so we can reuse the same code and access our networking logic from other view controllers.

import Foundation
import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase

//this struct will act as intermediary for communicating between app + Firebase.
struct UserService {
    static func create(_ firUser: FIRUser, username: String, completion: @escaping (User?) -> Void) {
        let userAttrs = ["username": username]
        
        let ref = Database.database().reference().child("users").child(firUser.uid)
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = User(snapshot: snapshot)
                completion(user)
            })
        }
    }
}
