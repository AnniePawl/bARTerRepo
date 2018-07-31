//
//  Storyboard+Utility.swift
//  BarterApp
//
//  Created by Anna Pawl on 7/30/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    enum BType: String {
        case home
        case login
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    convenience init(type: BType, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle: bundle)
    }
    
    static func initialViewController(for type: BType) -> UIViewController {
        let storyboard = UIStoryboard(type: type)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            fatalError("Couldn't instantiate initial view controller for \(type.filename) storyboard.")
        }
        
        return initialViewController
    
    
    }
}
