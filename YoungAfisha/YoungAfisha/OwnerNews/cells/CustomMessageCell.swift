//
//  CustomMessageCell.swift
//  YoungAfisha
//
//  Created by руслан on 15/9/19.
//  Copyright © 2019 руслан. All rights reserved.
//

import UIKit

class CustomMessageCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var messageBackground: UIView!
    
    @IBOutlet weak var messageBody: UILabel!
    @IBOutlet weak var senderUsername: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
