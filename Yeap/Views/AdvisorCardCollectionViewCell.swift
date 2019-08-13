//
//  AdvisorCardCollectionViewCell.swift
//  Yeap
//
//  Created by Agatha Rachmat on 13/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit

class AdvisorCardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shadowImage: UIView!
    @IBOutlet weak var advisorImageView: UIImageView!
    @IBOutlet weak var advisorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 2.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.YeapTheme.cardBorderColor.cgColor
        contentView.layer.masksToBounds = true
        
        shadowImage.layer.shadowColor = UIColor.YeapTheme.shading.cgColor
        shadowImage.layer.shadowOffset = CGSize(width: 5, height: 2)
        shadowImage.layer.shadowRadius = 5.0
        shadowImage.layer.shadowOpacity = 0.9
       shadowImage.layer.masksToBounds = false

       // shadowImage.layer.shadowPath = UIBezierPath(roundedRect: shadowImage.bounds, cornerRadius: shadowImage.layer.cornerRadius).cgPath
        shadowImage.layer.backgroundColor = UIColor.YeapTheme.cardBackground.cgColor
        advisorLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                UIView.animate(withDuration: 0.3, animations: {
                    self.shadowImage.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                    
                    }, completion: nil)
                
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.shadowImage.transform = .identity
                }, completion: nil)
                
                
            }
        }
    }

}
