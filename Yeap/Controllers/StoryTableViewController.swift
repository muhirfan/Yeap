//
//  StoryTableViewController.swift
//  Yeap
//
//  Created by Agatha Rachmat on 07/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit

class StoryTableViewController: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "firstCellTableViewCell", bundle: nil), forCellReuseIdentifier: "firstStoryCell")
        tableView.register(UINib(nibName: "StoryTableViewCell", bundle: nil), forCellReuseIdentifier: "storyCell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        uiSetting()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstStoryCell", for: indexPath) as! firstCellTableViewCell
        
            cell.userName.text = "Qorry"
            cell.EmploymentStatus.text = "Employed"
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "storyCell", for: indexPath) as! StoryTableViewCell
            cell.titleStoryCellLabel.text = "Day 1"
            return cell
        }
    }
 
    
    //MARK - Action to Setting Page
    ///  segue - Action to Setting Page
    @objc func segueToSettingPage(){
        performSegue(withIdentifier: "toSetting", sender: self)
    }
    
    /// Set NavigationBar
    func uiSetting(){
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
       // self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .medium) ]
        self.navigationItem.title = "Story"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Setting"), style: .plain, target: self, action: #selector(segueToSettingPage))
            //UIBarButtonItem(title: "Setting", style: .plain, target: self, action: #selector(segueToSettingPage))
    }


}
