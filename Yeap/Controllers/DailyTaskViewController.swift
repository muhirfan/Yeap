//
//  DailyTaskViewController.swift
//  Yeap
//
//  Created by Agatha Rachmat on 07/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit
import CoreData

class DailyTaskViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var taskCollectionView: UICollectionView!
    @IBOutlet weak var AdvisorAdviseTextview: UITextView!
    @IBOutlet weak var advisorImageView: UIImageView!
    
    fileprivate var tasks = Challenge.create()
    
    var advisors = Advisor.create()
    var selectedAdvisor: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskCollectionView.dataSource = self
        taskCollectionView.delegate = self
        selectedAdvisor = UserDefaults.standard.integer(forKey: "advisor")
        AdvisorAdviseTextview.text = advisors[selectedAdvisor].advise
        advisorImageView.image = advisors[selectedAdvisor].imageMini
        
    }
    
    private func saveToCoreData() {
    }
    
    private func loadFromData(){
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Task Cell", for: indexPath as IndexPath) as! DailyTaskCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.taskLabel.text = tasks[indexPath.item].title
        cell.taskImageView.image = tasks[indexPath.item].image
        cell.taskDescriptionLabel.text = tasks[indexPath.item].description
    
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
