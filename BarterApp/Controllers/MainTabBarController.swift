//
//  MainTabBarController.swift
//  BarterApp
//
//  Created by Anna Pawl on 8/2/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    let photoHelper = BPhotoHelper()
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        delegate = self
        tabBar.unselectedItemTintColor = .black
        
        photoHelper.completionHandler = { image in
            PostService.create(for: image)
        }
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController.tabBarItem.tag == 3 {
           
            print("take photo")
            
            photoHelper.presentActionSheet(from: self)
            return false
        }

        return true
    }
}

