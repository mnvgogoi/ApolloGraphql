//
//  CommentsViewController.swift
//  VCgraphqlDemo
//
//  Created by Vantage Circle on 16/09/22.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var commentsTable: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var commentsForFeed : GetCommentsQuery.Data.FeedsV2.Comment?
    var allComments = [GetCommentsQuery.Data.FeedsV2.Comment.Info.Edge]()
    
    var selectedFeedID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentsTable.delegate = self
        commentsTable.dataSource = self
        
        commentsTable.register(UINib.init(nibName: "CommentsCell", bundle: nil), forCellReuseIdentifier: "CommentsCell")
        
        getAllComments()
    
    }
    
    func getAllComments(){
        Network.shared.getCommentsForParticularFeed(completion: { comments in
              self.commentsForFeed = comments
              self.allComments = comments.info?.edges as! [GetCommentsQuery.Data.FeedsV2.Comment.Info.Edge]
              self.commentsLabel.text = "\(comments.count) Comments"
              DispatchQueue.main.async {
                  self.commentsTable.reloadData()
              }
          }, feedID: selectedFeedID)
    }
    
  
    
    func getFeedID(feedID: Int){
        print("get feed id called===")
        self.selectedFeedID = feedID
    }
    
    
    @IBAction func sendBtnPressed(_ sender: UIButton) {
        print("---")
        if let comment = textField.text{
            if (!comment.isEmpty){
                print(comment)
                Network.shared.addComment(feedID: selectedFeedID, commentText: comment, isReply: false)
                getAllComments()
            }
            else{
                print("no text")
            }
        }
    }
    
}

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsCell", for: indexPath) as? CommentsCell
        cell?.setData(commentNode: allComments[indexPath.row], feedID: self.selectedFeedID)
        cell?.delegate = self
        
        return cell ?? UITableViewCell()
    }
    
}

//MARK: - custom extension

extension CommentsViewController: RouteToLikeViewControllerProtocol{
    func navigateToLikes(_ feedId : Int) {
        self.likeLabelTapped(feedId)
    }
    

    //MARK: functions -
    func likeLabelTapped(_ selectedFeedId : Int) {
        let likeVC = LikesScreenViewController()
        likeVC.getFeedID(feedID: selectedFeedId)
        self.present(likeVC, animated: false)
    }
    
    
}
