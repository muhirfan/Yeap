//
//  StoryTableViewCell.swift
//  Yeap
//
//  Created by Agatha Rachmat on 07/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleStoryCellLabel: UILabel!
    @IBOutlet weak var dateStoryCellLabel: UILabel!
    @IBOutlet weak var storyCellImageView: UIImageView!
    @IBOutlet weak var storyReflectionLabel: UILabel!
    @IBOutlet weak var storyReflectionLongLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleStoryCellLabel.font
            = UIFont.preferredFont(forTextStyle: .title3)
        dateStoryCellLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        storyReflectionLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        storyReflectionLongLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
