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
    
    fileprivate var tasks = Task.create()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskCollectionView.dataSource = self
        taskCollectionView.delegate = self
        
//        saveToCoreData()
        loadFromData()
    }
    
    private func saveToCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        // 1
        let context = appDelegate.persistentContainer.viewContext
        
        // 2
        let entity = NSEntityDescription.entity(forEntityName: "Challenge", in: context)
        let challenge = NSManagedObject(entity: entity!, insertInto: context)
        
        // 3
        challenge.setValue("Challenge 1", forKey: "title")
        challenge.setValue("Are You Serious?", forKey: "reflection")
        challenge.setValue(1, forKey: "level")
        challenge.setValue(20, forKey: "exp")
        
        // 4
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    private func loadFromData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        // 1
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Challenge")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "title") as! String)
            }
            
        } catch {
            
            print("Failed")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Task Cell", for: indexPath as IndexPath) as! DailyTaskCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.taskLabel.text = tasks[indexPath.item].title
    
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
