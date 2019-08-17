//
//  Modul.swift
//  Yeap
//
//  Created by Muhammad Irfan on 16/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import Foundation

import Foundation
import UIKit

struct Module {
    static let ID_INTEGRITY: Int = 1
    static let ID_RESPECT: Int = 2
    static let ID_WILLINGNESS: Int = 3
    static let ID_DISCIPLINE: Int = 4
    static let ID_HUMBLENESS: Int = 5
    
    var id: Int = 0
    var name: String = ""
    var image: UIImage?
    var tobeMessage: String
    
    init(id: Int, name: String, imageName: String, tobeMessage: String) {
        self.id = id
        self.name = name
        self.image = UIImage(imageLiteralResourceName: imageName)
        self.tobeMessage = tobeMessage
    }
    
    static func create() -> [Module]
    {
        return [
            Module(id: 1, name: "Integrity", imageName: "integrity", tobeMessage: ""),
            Module(id: 2, name: "Respect", imageName: "respect", tobeMessage: ""),
            Module(id: 3, name: "Willingness", imageName: "willingness", tobeMessage: ""),
            Module(id: 4, name: "Discipline", imageName: "discipline", tobeMessage: ""),
            Module(id: 5, name: "Humbleness", imageName: "humbleness", tobeMessage: "")
        ]
    }
}
