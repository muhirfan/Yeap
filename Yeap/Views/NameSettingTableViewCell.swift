//
//  NameSettingTableViewCell.swift
//  Yeap
//
//  Created by Agatha Rachmat on 08/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit

class NameSettingTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var viewSettingCellBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameTextField.borderStyle = .none
        nameTextField.tintColor = UIColor(hexString:"FAB135")
        nameTextField.placeholder = "insert your name..."
        //nameTextField.
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //endEditing()
        self.viewSettingCellBackground.endEditing(true)
        print(touches)
    }

}
