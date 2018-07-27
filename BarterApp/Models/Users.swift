//
//  Users.swift
//  BarterApp
//
//  Created by Anna Pawl on 7/25/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot


class User {
    
   // MARK: - Properties
    
    let uid: String
    let username: String
    
    // MARK: - Init
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    
     // MARK: - Singleton
    //private static variable to hold our current user
    private static var _current: User?
    //computed variable that only has a getter that can access the private _current variable
    static var current: User {
    //Check that _current of type User? isn't nil. If _current is nil, and current is being read, guard statement will crash with fatalError()
        guard let currentUser = _current else {
            fatalError("Error: current user doesn't exist")
        }
        return currentUser
    }
    
    // MARK: - Class Methods
    //custom setter method to set the current user.
    static func setCurrent(_ user: User) {
        _current = user
    }
    
    
//Failable Initializer?
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
    }
}
