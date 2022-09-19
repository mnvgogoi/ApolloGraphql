//
//  LikesTableCell.swift
//  VCgraphqlDemo
//
//  Created by Vantage Circle on 14/09/22.
//

import UIKit

class LikesTableCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageBackground: UIView!
    @IBOutlet weak var profilePicImageView: UIImageView!
    
    override func awakeFromNib() {
        print("nib")
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(users: GetLikedUsersForParticularFeedQuery.Data.FeedsV2.Like.User, index: Int){
        print("set dastas======")
        self.nameLabel.text = users.name
    }
    
}
