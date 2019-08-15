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
        reuseableButton.layer.borderColor = UIColor(hexString:"FAB135").cgColor
        reuseableButton.layer.cornerRadius = 10
        reuseableButton.layer.borderWidth = 2.0
        reuseableButton.setTitleColor(UIColor(hexString: "072238"), for: .normal)
        reuseableButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        reuseableLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
