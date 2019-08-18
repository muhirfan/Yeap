//
//  Challenge.swift
//  Yeap
//
//  Created by Muhammad Irfan on 16/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import Foundation
import UIKit

struct Challenge{
    var id: Int = 0
    var title: String = ""
    var description: String = ""
    var stage: Int = 0
    var modulId: Int = 0
    var image: UIImage?
    
    init(id: Int, title: String, description: String, stage: Int, modulId: Int, imageName: String) {
        self.id = id
        self.title = title
        self.description = description
        self.stage = stage
        self.modulId = modulId
        self.image = UIImage(imageLiteralResourceName: imageName)
    }
    
    static func create() -> [Challenge] {
        return [
            Challenge(id: 1, title: "Kind", description: "Go visit someone who need comfort, and hug them.", stage: 1, modulId: Module.ID_INTEGRITY, imageName: "kind"),
            Challenge(id: 2, title: "Spend time", description: "Spend time with someone you care of, talk about what they like.", stage: 1, modulId: Module.ID_INTEGRITY, imageName: "spend-time"),
            Challenge(id: 3, title: "Find Solution", description: "Go visit someone who need comfort, and hug them.", stage: 1, modulId: Module.ID_INTEGRITY, imageName: "find-solution"),
            Challenge(id: 4, title: "Accountable", description: "If you making a mistake, no matter what, admit it and say sorry in front of them.", stage: 1, modulId: Module.ID_INTEGRITY, imageName: "accountable"),
            Challenge(id: 5, title: "Generous", description: "Give your money to those who need the most immediately.", stage: 1, modulId: Module.ID_INTEGRITY, imageName: "generous")
        ]
    }
}

