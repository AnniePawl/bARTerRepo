//
//  Users.swift
//  BarterApp
//
//  Created by Anna Pawl on 7/25/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User: Codable {
    
    // MARK: - Properties
    
    let uid: String
    let username: String
    
    // MARK: - Init
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
    }
    
    // MARK: - Singleton
    private static var _current: User?
    static var current: User {
        guard let currentUser = _current else {
            fatalError("Error: current user doesn't exist")
        }
        return currentUser
    }
    
    // MARK: - Class Methods
    static func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        // 2
        if writeToUserDefaults {
            // 3
            if let data = try? JSONEncoder().encode(user) {
                // 4
                UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
            }
        }
        
        _current = user
    }
    }






