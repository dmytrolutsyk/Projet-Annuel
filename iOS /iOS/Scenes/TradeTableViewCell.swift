//
//  TradeTableViewCell.swift
//  iOS
//
//  Created by Norman on 29/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import UIKit

class TradeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
