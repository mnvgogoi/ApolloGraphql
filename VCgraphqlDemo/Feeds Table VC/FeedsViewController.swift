//
//  FeedsViewController.swift
//  VCgraphqlDemo
//
//  Created by Vantage Circle on 13/09/22.
//

import UIKit

class FeedsViewController: UIViewController {
    
    @IBOutlet weak var feedsTable: UITableView!
    
    var feedsModel = [GetAllFeedsQuery.Data.FeedsV2]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedsTable.delegate = self
        feedsTable.dataSource = self
        
        feedsTable.register(UINib.init(nibName: "FeedsTableCell", bundle: nil), forCellReuseIdentifier: "FeedsTableCell")
        
        Network.shared.getData { feeds in
            self.feedsModel = feeds
            DispatchQueue.main.async {
                self.feedsTable.reloadData()
            }
        }
    }
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension FeedsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedsModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(500)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedsTableCell", for: indexPath) as? FeedsTableCell
        cell?.setData(feed: feedsModel[indexPath.row])
        
        cell?.delegate = self
        cell?.commentsDelegate = self
        
        //        cell?.likesLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.likeLabelTapped)))
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("feed id---",feedsModel[indexPath.row].feedId)
    }
    
}

//MARK: - Custom Delegates

extension FeedsViewController : RouteToLikeViewControllerProtocol, RouteToCommentViewControllerProtocol {
    
    func navigateToComments(_ feedId: Int) {
        self.commentLabelTapped(feedId)
    }
    
    func navigateToLikes(_ feedId : Int) {
        self.likeLabelTapped(feedId)
    }
    
    
    
    //MARK: functions -
    func likeLabelTapped(_ selectedFeedId : Int) {
        let likeVC = LikesScreenViewController()
        likeVC.getFeedID(feedID: selectedFeedId)
        self.present(likeVC, animated: false)
    }
    
    func commentLabelTapped(_ selectedFeedId : Int) {
        let commentsVC = CommentsViewController()
        commentsVC.getFeedID(feedID: selectedFeedId)
        navigationController?.pushViewController(commentsVC, animated: false)
    }
}




