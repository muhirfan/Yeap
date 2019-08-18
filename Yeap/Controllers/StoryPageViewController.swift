//
//  StoryPageViewController.swift
//  Yeap
//
//  Created by Agatha Rachmat on 14/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit

class StoryPageViewController: UIViewController {
    @IBOutlet weak var reflectionImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
   // @IBOutlet weak var reflectionLabel: UILabel!
    @IBOutlet weak var dateSubLabel: UILabel!
    
    @IBOutlet weak var reflectionTextView: UITextView!
    @IBOutlet weak var taskLabel: UILabel!
    
    var selectedRow : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetting()
        let screenSize: CGRect = UIScreen.main.bounds
        reflectionImageView.frame = CGRect(x: 20, y: 20, width: screenSize.width - 40, height: screenSize.height * 0.6)
       //reflectionLabel.sizeToFit()
        reflectionTextView.text = """
        Today I visited my grandma, I brought her martabak, One of her favorite food. I'm glad I'm able to visit her.
        """
        reflectionTextView.textAlignment = .left
        dateLabel.sizeToFit()

        print("row \(String(describing: selectedRow))")
        
        if let day = selectedRow{
            self.navigationItem.title = "Day \(String(describing: day))"
        }
    }
    
    func uiSetting(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold) ]
        self.navigationController?.hidesBarsOnSwipe = false
       // shareButton. = UIBarButtonItem.SystemItem.action
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(toShareStory))
        
        reflectionImageView.layer.cornerRadius = 10
        reflectionImageView.backgroundColor =  .clear
        reflectionImageView.image = UIImage(named: "visitGrandma")
        reflectionImageView.contentMode = .scaleAspectFill
        dateLabel.text = "August 18th, 2019 "
        dateSubLabel.text = "Integrity"
        taskLabel.text = "Kind"
        
    }
    
    @objc func toShareStory(){
        print("share")
    }
}
