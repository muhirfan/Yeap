//
//  AdvisorViewController.swift
//  Yeap
//
//  Created by Agatha Rachmat on 08/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit


class AdvisorViewController: UIViewController {
    
    enum AdvisorType: String, CaseIterable {
        case grandma = "Swag grandma"
        case auntUncle = "Cool aunt uncle"
        case coach = "Lady coach"
        case sergeant = "Drill sergeant"
    }
    var advisorGetRaw : [String] = []

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
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(backButtonPressed))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", style: .done, target: self, action: #selector(saveToCoreData))
        self.navigationItem.title = "Choose Your Advisor"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .bold) ]
    }
    
    @objc func saveToCoreData(){
        print("save")
    }
    
    @objc func backButtonPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension AdvisorViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AdvisorType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "advisorCardCell", for: indexPath) as! AdvisorCardCollectionViewCell
        
        cell.advisorImageView.image = UIImage(named: advisorGetRaw[indexPath.row])
        //cell.shadowImage.layer.borderColor = UIColor.darkGray.cgColor
        cell.advisorLabel.text = "\(advisorGetRaw[indexPath.row])"
        cell.contentView.backgroundColor = UIColor.YeapTheme.screenBackground
        
       // cell.shadowImage.addShadow(offset: CGSize.init(width: 0, height: 10), color: UIColor.black, radius: 2.0, opacity: 0.55)
       
        return cell
    }
    
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: CGFloat((collectionView.frame.size.width ) - 20), height: CGFloat(100))
//    }
}

//extension AdvisorViewController : UICollectionViewDelegateFlowLayout {
//    
//    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let itemsPerRow:CGFloat = 10
//        let hardCodedPadding:CGFloat = 40
//        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
//        let itemHeight = collectionView.bounds.height - (3 * hardCodedPadding)
//        return CGSize(width: itemWidth, height: itemHeight)
//    }
//}

