//
//  MenuTableViewCell.swift
//  Bandio
//
//  Created by DP on 12/18/19.
//  Copyright © 2019 MostafaASHRAF. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageMenu: UIImageView!
    @IBOutlet weak var labelMenu: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
