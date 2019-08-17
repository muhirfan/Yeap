//
//  Advisor.swift
//  Yeap
//
//  Created by Muhammad Irfan on 16/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import Foundation
import UIKit

struct Advisor {
    let ID_GRANDMA: Int = 1
    let ID_COACH: Int = 2
    let ID_AUNT_UNCLE: Int = 3
    let ID_SERGEANT: Int = 4
    
    var id: Int = 0
    var name: String = ""
    var image: UIImage?
    var imageMini: UIImage?
    
    init(id: Int, name: String, imageName: String, imageMiniName: String) {
        self.id = id
        self.name = name
        self.image = UIImage(imageLiteralResourceName: imageName)
        self.imageMini = UIImage(imageLiteralResourceName: imageMiniName)
    }
    
    static func create() -> [Advisor]
    {
        return [
            Advisor(id: 1, name: "Swag Grandma", imageName: "grandma", imageMiniName: "grandma-mini"),
            Advisor(id: 2, name: "Lady Coach", imageName: "coach", imageMiniName: "coach-mini"),
            Advisor(id: 3, name: "Cool aunty and uncle", imageName: "aunt-uncle-mini", imageMiniName: "aunt-uncle-mini"),
            Advisor(id: 4, name: "Drill Sergeant", imageName: "sergeant", imageMiniName: "sergeant-mini")
        ]
    }
}
