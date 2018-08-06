//
//  BPhotoHelper.swift
//  BarterApp
//
//  Created by Anna Pawl on 8/2/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//

import UIKit

class BPhotoHelper: NSObject {
    
    
    // MARK: - Properties
    
    var completionHandler: ((UIImage) -> Void)?
    
    // MARK: - Helper Methods
    
//    func presentImagePickerController(with sourceType: UIImagePickerControllerSourceType, from viewController: UIViewController) {
//        let imagePickerController = UIImagePickerController()
//        imagePickerController.sourceType = sourceType
//
//        viewController.present(imagePickerController, animated: true)
//    }

    
    
   
        func presentActionSheet(from viewController: UIViewController) {
            
            // 1
            let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .actionSheet)
            
            // 2
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                // 3
                let capturePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: { action in
                    // do nothing yet...
                })
                
                // 4
                alertController.addAction(capturePhotoAction)
            }
            
            // 5
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let uploadAction = UIAlertAction(title: "Upload from Library", style: .default, handler: { action in
                    // do nothing yet...
                })
                
                alertController.addAction(uploadAction)
            }
            
            // 6
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            // 7
            viewController.present(alertController, animated: true)
        }
        
    }

