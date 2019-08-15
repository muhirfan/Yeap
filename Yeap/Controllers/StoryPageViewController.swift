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
    @IBOutlet weak var reflectionLabel: UILabel!
    @IBOutlet weak var dateSubLabel: UILabel!
    
    @IBOutlet weak var taskLabel: UILabel!
    
    var selectedRow : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetting()
        let screenSize: CGRect = UIScreen.main.bounds
        reflectionImageView.frame = CGRect(x: 20, y: 20, width: screenSize.width - 40, height: screenSize.height * 0.6)
       //reflectionLabel.sizeToFit()
        reflectionLabel.text = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        """
        reflectionLabel.textAlignment = .left
        //reflectionLabel.lineBreakMode = .byWordWrapping
        reflectionLabel.numberOfLines = 0
        reflectionLabel.adjustsFontSizeToFitWidth = true
        dateLabel.sizeToFit()

        print("row \(selectedRow)")
        
        if let day = selectedRow{
            self.navigationItem.title = "Day \(String(describing: selectedRow!))"
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
        reflectionImageView.backgroundColor =  .orange
    }
    
    @objc func toShareStory(){
        print("share")
    }
}
