//
//  MessageTableViewCell.swift
//  BarterApp
//
//  Created by Anna Pawl on 8/9/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    
    @IBOutlet weak var messageCellImage: UIImageView!
    @IBOutlet weak var messageCellChat: UITextView!
    @IBOutlet weak var inerViewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
