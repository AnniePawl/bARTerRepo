//
//  MessagesViewController.swift
//  BarterApp
//
//  Created by Anna Pawl on 7/31/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//

import Foundation
import UIKit

class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var inerViewCell: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    var messages: [Message] = [
        Message(image:#imageLiteral(resourceName: "girl1") ,chat: "Hey! I love your work. Are you interested in swapping? "),
        Message(image: #imageLiteral(resourceName: "girl3"),chat: "Wahoo! I should be done with your piece by Friday. I'll check in soon"),
        Message(image: #imageLiteral(resourceName: "guy1"),chat: "I'm down to trade a ceramic mug for one of your prints"),
        Message(image: #imageLiteral(resourceName: "girl2"),chat: "How many weeks do you need to compelete the project?"),
        Message(image:#imageLiteral(resourceName: "girl 5") ,chat: "Send me some color palettes that interest you!"),
        Message(image:#imageLiteral(resourceName: "guy 3") ,chat: "Just checking in.Your piece is coming along! Need a few more days."),
        Message(image:#imageLiteral(resourceName: "guy 2") ,chat: "Shoot over some images for inspiration!")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
        
        image1.layer.masksToBounds = true
        image1.layer.cornerRadius = image1.frame.height / 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
        let message = messages[indexPath.row]
        
        
        cell.messageCellImage.image = message.image
        cell.messageCellChat.text = message.chat
        cell.inerViewCell.layer.masksToBounds = true
        cell.inerViewCell.layer.cornerRadius = 15
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! UITableViewCell
//        print(messageCell.count)
//        let messageCell = messageCell[indexPath.item]
//        cell.messageCellImage.image = messageCell.image
//
//        return cell
//    }
}

