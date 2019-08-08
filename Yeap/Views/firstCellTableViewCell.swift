//
//  firstCellTableViewCell.swift
//  Yeap
//
//  Created by Agatha Rachmat on 07/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit

class firstCellTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var EmploymentStatus: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var lineViewEmployment: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        userImageView.layer.cornerRadius = 56
        userImageView.backgroundColor = UIColor.red
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
