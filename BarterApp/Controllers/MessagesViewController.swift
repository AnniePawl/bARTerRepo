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
    
    var messages: [Message] = [
        Message(image:#imageLiteral(resourceName: "girl1") ,chat: "Hey! I love your work. Are you interested in swapping? "),
        Message(image: #imageLiteral(resourceName: "girl3"),chat: "Wahoo! I should be done with your piece by Friday. I'll check in soon"),
        Message(image: #imageLiteral(resourceName: "guy1"),chat: "I'm down to trade a ceramic mug for one of your prints"),
        Message(image: #imageLiteral(resourceName: "girl2"),chat: "How many weeks do you need to compelete the project?")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
        let message = messages[indexPath.row]
        
        
        cell.messageCellImage.image = message.image
        cell.messageCellChat.text = message.chat
        
        
        return cell
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

