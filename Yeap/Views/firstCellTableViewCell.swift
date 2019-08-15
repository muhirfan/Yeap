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
    @IBOutlet weak var tappableView: UIView!
    
    lazy var photoViewTappable : UIView = {
        var photoView = UIView()
        var width = UIScreen.main.bounds.width
        var height = UIScreen.main.bounds.height
        photoView.frame = CGRect(x: 30, y: 30, width: 30, height: 30)
        photoView.layer.cornerRadius = 15
        photoView.backgroundColor = UIColor.blue
        return photoView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImageView.layer.cornerRadius = 60
        userImageView.backgroundColor = UIColor(hexString:"FAB135")
        userImageView.layer.borderColor = UIColor(hexString:"FAB135").cgColor
        userImageView.layer.borderWidth = 2
        lineView.backgroundColor = UIColor(hexString:"FAB135")
        lineViewEmployment.backgroundColor = UIColor(hexString:"FAB135")
        // self.contentView.addSubview(photoViewTappable)
        tappableView.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
