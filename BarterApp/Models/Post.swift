//
//  Post.swift
//  BarterApp
//
//  Created by Anna Pawl on 8/5/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//

import UIKit
import FirebaseDatabase.FIRDataSnapshot

class Post {
    var key: String?
    let imageURL: String
    let imageHeight: CGFloat
    let creationDate: Date
    
    
    init(imageURL: String, imageHeight: CGFloat) {
        self.imageURL = imageURL
        self.imageHeight = imageHeight
        self.creationDate = Date()
    }
}


