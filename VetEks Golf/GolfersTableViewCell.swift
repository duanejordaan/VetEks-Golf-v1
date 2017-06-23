//
//  GolfersTableViewCell.swift
//  VetEks Golf
//
//  Created by Duane Jordaan on 2017/06/22.
//  Copyright © 2017 Duane Jordaan. All rights reserved.
//

import UIKit






class GolfersTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var thumbnailImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handicapLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
}
