//
//  NewsfeedCell.swift
//  VKNewsFeed
//
//  Created by Oleg Kanatov on 15.11.21.
//

import Foundation
import UIKit

class NewsfeedCell: UITableViewCell {
    
    static let reuseId = "NewsfeedCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLAbel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var sharesLabel: UILabel!
    @IBOutlet weak var veiwLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
