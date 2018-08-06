//
//  PostHeaderCell.swift
//  BarterApp
//
//  Created by Anna Pawl on 8/6/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//

import Foundation
import UIKit

class PostHeaderCell: UITableViewCell {
    
    static let height: CGFloat = 54
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func optionsButtonTapped(_ sender: UIButton) {
        print("options button tapped")
    }
    
}
