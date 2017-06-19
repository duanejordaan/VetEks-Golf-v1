//
//  HomeTableViewCell.swift
//  VetEks Golf
//
//  Created by Duane Jordaan on 2017/06/19.
//  Copyright © 2017 Duane Jordaan. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    
    
}
