//
//  HomeViewController.swift
//  BarterApp
//
//  Created by Anna Pawl on 7/30/18.
//  Copyright © 2018 Anna Pawl. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher


class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var posts = [Post]()

//    func configureTableView() {
//        // remove separators for empty cells
//        tableView.tableFooterView = UIView()
//        // remove separators from cells
//        tableView.separatorStyle = .none
//    }
    
//    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSwipeGestures()

        UserService.posts(for: User.current) { (posts) in
            self.posts = posts
            
            let post = posts[0]
            let imageURL = URL(string: post.imageURL)
            self.itemImage.kf.setImage(with: imageURL)
        }
        
    }
    
    func setupSwipeGestures() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer)
    {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction
            {
            case UISwipeGestureRecognizerDirection.right:
                //write your logic for right swipe
                print("Swiped right")
                
            case UISwipeGestureRecognizerDirection.left:
                //write your logic for left swipe
                print("Swiped left")
                
            default:
                break
            }
        }
    }
}


//// MARK: - UITableViewDataSource
//
//extension HomeViewController: UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return posts.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let post = posts[indexPath.section]
//
//        switch indexPath.row {
//        case 0:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "PostHeaderCell") as! PostHeaderCell
//
//            return cell
//
//        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "PostImageCell") as! PostImageCell
//            let imageURL = URL(string: post.imageURL)
//            cell.postImageView.kf.setImage(with: imageURL)
//
//            return cell
//
//        default:
//            fatalError("Error: unexpected indexPath.")
//        }
//    }
//}
//
//// MARK: - UITableViewDelegate
//
//extension HomeViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch indexPath.row {
//        case 0:
//            return PostHeaderCell.height
//
//        case 1:
//            let post = posts[indexPath.section]
//            return post.imageHeight
//
//        default:
//            fatalError()
//        }
//    }
//}
