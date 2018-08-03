//
//  BPhotoHelper.swift
//  BarterApp
//
//  Created by Anna Pawl on 8/2/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//

import UIKit

class MGPhotoHelper: NSObject {
    
    // MARK: - Properties
    
    var completionHandler: ((UIImage) -> Void)?
    
    // MARK: - Methods
    
    func presentActionSheet(from viewController: UIViewController) {
        
        func presentActionSheet(from viewController: UIViewController) {
          
            let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .actionSheet)
            
           
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
           
                let capturePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: { action in
                    // do nothing yet...
                })
                

                alertController.addAction(capturePhotoAction)
            }
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let uploadAction = UIAlertAction(title: "Upload from Library", style: .default, handler: { action in
                    // do nothing yet...
                })
                
                alertController.addAction(uploadAction)
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
    
            viewController.present(alertController, animated: true)
        }
        
    }
}
