//
//  Task.swift
//  Yeap
//
//  Created by Muhammad Irfan on 07/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit

class Task
{
    var title: String = ""
    var level: Int
    var exp: Int
    var image: UIImage?
    
    init(title: String, level: Int, exp: Int, imageName: String)
    {
        self.title = title
        self.level = level
        self.exp = exp
//        self.image = UIImage(imageLiteralResourceName: imageName)
    }
    
    static func create() -> [Task]
    {
        return [
            Task(title: "Spend time with someone you care of, talk about what they like.", level: 1, exp: 20, imageName: "r1"),
            Task(title: "Accountable. If you making a mistake, no matter what, admit it in and say sorry in front of them", level: 1, exp: 20, imageName: "r1"),
            Task(title: "Kind. Go visit someone who need comfort, and hug them.", level: 1, exp: 20, imageName: "r1")
        ]
    }
    
}
