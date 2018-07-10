//
//  POITableViewCell.swift
//  AnotherGetGoing
//
//  Created by Alla Bondarenko on 2018-06-20.
//  Copyright © 2018 Alla Bondarenko. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
