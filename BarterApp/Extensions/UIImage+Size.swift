//
//  UIImage+Size.swift
//  BarterApp
//
//  Created by Anna Pawl on 8/5/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    var aspectHeight: CGFloat {
        let heightRatio = size.height / 736
        let widthRatio = size.width / 414
        let aspectRatio = fmax(heightRatio, widthRatio)
        
        return size.height / aspectRatio
    }
}
