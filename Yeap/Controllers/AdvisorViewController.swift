//
//  AdvisorViewController.swift
//  Yeap
//
//  Created by Agatha Rachmat on 08/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit
import CoreData

class AdvisorViewController: UIViewController {
    
    enum AdvisorType: String, CaseIterable {
        case grandma = "Swag grandma"
        case auntUncle = "Cool aunt uncle"
        case coach = "Lady coach"
        case sergeant = "Drill sergeant"
    }
    var advisorGetRaw : [String] = []
    var backButton = UIBarButtonItem()
    var selectedAdvisor : Int?
    var selectedCell : [IndexPath]?
    @IBOutlet weak var chooseAdvisorLabel: UILabel!
    @IBOutlet weak var advisorCardCollectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.YeapTheme.screenBackground
        self.advisorCardCollectionView.delegate = self
        self.advisorCardCollectionView.dataSource = self
        self.advisorCardCollectionView.showsHorizontalScrollIndicator = true
        self.advisorCardCollectionView.showsVerticalScrollIndicator = false
        self.advisorCardCollectionView.isPagingEnabled = true;
        self.advisorCardCollectionView.alwaysBounceVertical = false
        self.advisorCardCollectionView.backgroundColor = UIColor.YeapTheme.screenBackground
        advisorGetRaw = [AdvisorType.grandma.rawValue, AdvisorType.auntUncle.rawValue, AdvisorType.coach.rawValue, AdvisorType.sergeant.rawValue]
        uiSetting()

    }
    
    private func saveToCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        // 1
        let context = appDelegate.persistentContainer.viewContext
        
        // 2
        let entity = NSEntityDescription.entity(forEntityName: "Advisor", in: context)
        let advisor = NSManagedObject(entity: entity!, insertInto: context)
        
        // 3
        advisor.setValue(advisorGetRaw[selectedAdvisor!], forKey: "name")
        print("advisor: \(advisorGetRaw[selectedAdvisor!])")
        // 4
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    @objc func saveAdvisorToCoreData(){
//        if selectedAdvisor == nil{
//            let alert = UIAlertController(title: "Please select your advisor", message: nil, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            self.present(alert, animated: true)
//        } else{
//        saveToCoreData()
//        print("save")
//        self.dismiss(animated: true, completion: nil)
//        }
        
        if selectedAdvisor == nil{
            let alert = UIAlertController(title: "Please select your advisor", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        } else{
            UserDefaults.standard.set((selectedAdvisor ?? 0+1), forKey: "advisor")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func backButtonPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func uiSetting(){
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(backButtonPressed))
        self.navigationItem.leftBarButtonItem = cancelButton
        cancelButton.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)], for: .normal)
        cancelButton.tintColor = UIColor(hexString: "072238")
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveAdvisorToCoreData))
        self.navigationItem.rightBarButtonItem = saveButton
        saveButton.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)], for: .normal)
        saveButton.tintColor = UIColor(hexString: "072238")
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        chooseAdvisorLabel.numberOfLines = 0
        chooseAdvisorLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        chooseAdvisorLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        chooseAdvisorLabel.text = "Choose your advisor!"
        chooseAdvisorLabel.textColor = UIColor(hexString: "072238")
        chooseAdvisorLabel.sizeToFit()
    }
    
}

extension AdvisorViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AdvisorType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "advisorCardCell", for: indexPath) as! AdvisorCardCollectionViewCell
        
        cell.advisorImageView.image = UIImage(named: advisorGetRaw[indexPath.row])
        cell.advisorLabel.text = "\(advisorGetRaw[indexPath.row])"
        cell.contentView.backgroundColor = UIColor.YeapTheme.screenBackground
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedAdvisor = indexPath.row
        print("\(indexPath.row)")
    }
    

    
}


