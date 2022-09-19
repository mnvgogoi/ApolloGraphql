//
//  FeedsTableCell.swift
//  VCgraphqlDemo
//
//  Created by Vantage Circle on 13/09/22.
//

import UIKit
import Kingfisher

protocol RouteToLikeViewControllerProtocol {
    func navigateToLikes(_ feedId : Int)
}

protocol RouteToCommentViewControllerProtocol {
    func navigateToComments(_ feedId : Int)
}

class FeedsTableCell: UITableViewCell {

    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var receiverNameLabel: UILabel!
    @IBOutlet weak var feedNameLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backgroundcard: UIView!
    @IBOutlet weak var imageBackground: UIView!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var likesLabelBtn: UIButton!
    @IBOutlet weak var commentsLabelBtn: UIButton!
    @IBOutlet weak var likesBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    
    var likedUsers: [String] = []
    
    var delegate : RouteToLikeViewControllerProtocol?
    var commentsDelegate : RouteToCommentViewControllerProtocol?
    var currentFeedId = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundcard.layer.cornerRadius = 20
        imageBackground.layer.cornerRadius = 20
        selectionStyle.self = .none
        likesLabelBtn.isHidden = true
        commentsLabelBtn.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(feed: GetAllFeedsQuery.Data.FeedsV2){
        self.senderNameLabel.text = feed.sender?.fragments.nameAndId.name
        self.receiverNameLabel.text = feed.receivers![0].fragments.nameAndId.name
        self.feedNameLabel.text = feed.name
        self.descriptionLabel.text = feed.description
        self.createdAtLabel.text = feed.createdAt
        self.currentFeedId = feed.feedId
        self.likesBtn.isSelected = feed.likes.isLiked
        
        if (feed.likes.count > 0)
        {
            self.likesLabelBtn.isHidden = false
            self.likesLabelBtn.setTitle("\(feed.likes.count) Like", for: .normal)
            
        }
        else{
            self.likesLabelBtn.isHidden = true
        }
        
        if (feed.comments.count > 0)
        {
            self.commentsLabelBtn.isHidden = false
            self.commentsLabelBtn.setTitle("\(feed.comments.count) Comment", for: .normal)
        }
        else{
            self.commentsLabelBtn.isHidden = true
        }
        
        
        let urlImage = URL(string: feed.image)
        feedImageView?.kf.setImage(with: urlImage)
        
    }
    
    @IBAction func likeLabelBtn(_ sender: UIButton) {
        self.delegate?.navigateToLikes(self.currentFeedId)
    }
    
    @IBAction func commentLabelBtn(_ sender: UIButton) {
        self.commentsDelegate?.navigateToComments(self.currentFeedId)
    }
    
    @IBAction func likeBtnPressed(_ sender: UIButton) {

    }
    
    @IBAction func commentBtnPressed(_ sender: UIButton) {
    }
    
    
    
}
