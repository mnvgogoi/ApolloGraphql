//
//  ReplyCell.swift
//  VCgraphqlDemo
//
//  Created by Vantage Circle on 16/09/22.
//

import UIKit

class ReplyCell: UITableViewCell {

    @IBOutlet weak var replyUserNameLabel: UILabel!
    @IBOutlet weak var replyCommentLAbel: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var likesLabelBtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likesLabelBtn.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setData(replyInfo: GetCommentsQuery.Data.FeedsV2.Comment.Info.Edge.Node.Reply.Info){
        self.replyUserNameLabel.text = replyInfo.user.name
        self.replyCommentLAbel.text = replyInfo.text
        self.likeBtn.isSelected = replyInfo.likes.isLiked
        
        if (replyInfo.likes.count > 0)
        {
            self.likesLabelBtn.isHidden = false
            self.likesLabelBtn.setTitle("\(replyInfo.likes.count) Like", for: .normal)
        }
        
    }
    
}
