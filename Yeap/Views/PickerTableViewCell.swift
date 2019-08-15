//
//  PickerTableViewCell.swift
//  Yeap
//
//  Created by Agatha Rachmat on 08/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit

class PickerTableViewCell: UITableViewCell {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        pickerLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        pickerLabel.textColor = UIColor(hexString: "072238")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
