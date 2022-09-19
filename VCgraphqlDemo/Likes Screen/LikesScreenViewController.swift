//
//  LikesScreenViewController.swift
//  VCgraphqlDemo
//
//  Created by Vantage Circle on 14/09/22.
//

import UIKit
import Apollo

class LikesScreenViewController: UIViewController {
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var likedUserTable: UITableView!
    @IBOutlet weak var backgroundCard: UIView!
    
    var selectedFeed: GetLikedUsersForParticularFeedQuery.Data.FeedsV2.Like?
    var likedUsers = [GetLikedUsersForParticularFeedQuery.Data.FeedsV2.Like.User]()
    
    var selectedFeedID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        likedUserTable.delegate = self
        likedUserTable.dataSource = self
        
        backgroundCard.layer.cornerRadius = 20
        
        likedUserTable.register(UINib.init(nibName: "LikesTableCell", bundle: nil), forCellReuseIdentifier: "LikesTableCell")
        
        Network.shared.getLikedUsersForParticularFeed(completion: { feed in
            self.selectedFeed = feed
            self.likedUsers = feed.users
            self.likeLabel.text = "\(feed.count) Like"
            DispatchQueue.main.async {
                self.likedUserTable.reloadData()
            }
        }, feedID: selectedFeedID)
        print("after get feed.. feed id  -   ",selectedFeedID)
    }
    
    func getFeedID(feedID: Int){
        print("get feed id called++++++")
        selectedFeedID = feedID
    }
}



extension LikesScreenViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count----",likedUsers.count)
        return likedUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikesTableCell", for: indexPath) as? LikesTableCell
        
        cell?.setData(users: likedUsers[indexPath.row], index: indexPath.row)
        
        return cell ?? UITableViewCell()
    }
    
    
}
