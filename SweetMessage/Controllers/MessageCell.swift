//
//  MessageCell.swift
//  SweetMessage
//
//  Created by Fabio Quintanilha on 1/5/18.
//  Copyright © 2018 Fabio Quintanilha. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var messageLabel : UILabel!
    @IBOutlet weak var timeLabel : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
