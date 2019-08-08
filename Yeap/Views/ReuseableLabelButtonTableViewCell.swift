//
//  ReuseableLabelButtonTableViewCell.swift
//  Yeap
//
//  Created by Agatha Rachmat on 08/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit

class ReuseableLabelButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var reuseableLabel: UILabel!
    @IBOutlet weak var reuseableButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
