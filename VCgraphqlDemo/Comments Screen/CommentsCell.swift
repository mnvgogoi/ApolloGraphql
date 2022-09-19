//
//  CommentsCell.swift
//  VCgraphqlDemo
//
//  Created by Vantage Circle on 16/09/22.
//

import UIKit

class CommentsCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentTextLabel: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var replyBtn: UIButton!
    @IBOutlet weak var allLikesBtn: UIButton!
    @IBOutlet weak var replyTable: UITableView!
    
    //using delegate
    var delegate : RouteToLikeViewControllerProtocol?
    var selectedFeedId: Int = 0
    
    var replyInfo = [GetCommentsQuery.Data.FeedsV2.Comment.Info.Edge.Node.Reply.Info]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        replyTable.delegate = self
        replyTable.dataSource = self
        allLikesBtn.isHidden = true
        
        replyTable.isHidden = true
        
        replyTable.register(UINib.init(nibName: "ReplyCell", bundle: nil), forCellReuseIdentifier: "ReplyCell")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(commentNode: GetCommentsQuery.Data.FeedsV2.Comment.Info.Edge,feedID: Int){
        self.nameLabel.text = commentNode.node.user.name
        self.commentTextLabel.text = commentNode.node.text
        self.selectedFeedId = feedID
        if(commentNode.node.likes.count > 0)
        {
            self.allLikesBtn.isHidden = false
            self.allLikesBtn.setTitle("\(commentNode.node.likes.count) Like", for: .normal)
        }
        if(commentNode.node.replies.count > 0)
        {
            self.replyBtn.setTitle("\(commentNode.node.replies.count) Reply", for: .normal)
        }
        if(commentNode.node.likes.isLiked){
            self.likeBtn.isSelected = true
        }
        if(commentNode.node.replies.count > 0){
            self.replyTable.isHidden = false
            self.replyInfo = commentNode.node.replies.info
        }

    }
    
    @IBAction func allLikesBtnPressed(_ sender: UIButton) {
        self.delegate?.navigateToLikes(selectedFeedId)
    }
    @IBAction func likeBtnPressed(_ sender: UIButton) {
        likeBtn.isSelected = !(likeBtn.isSelected)
    }
}

extension CommentsCell: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("reply count  .... ", replyInfo.count)
        return replyInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReplyCell", for: indexPath) as? ReplyCell
        
        //sending replies
        cell?.setData(replyInfo: replyInfo[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    
}
