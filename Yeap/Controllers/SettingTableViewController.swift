//
//  SettingTableViewController.swift
//  Yeap
//
//  Created by Agatha Rachmat on 07/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    var EmploymentStatus = ["Choose One","Unemployed","Employed"]
    var Education = ["Choose One","Vocational High School","High School"]
    lazy var photoViewTappable : UIView = {
        var photoView = UIView()
        photoView.frame = CGRect(x: 10, y: 10, width: 30, height: 30)
        photoView.backgroundColor = UIColor.red
        return photoView
    }()
    var imagePicker: ImagePicker!
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetting()
        self.tableView = UITableView(frame: CGRect.zero, style: .grouped)

        tableView.register(UINib(nibName: "firstCellTableViewCell", bundle: nil), forCellReuseIdentifier: "firstStoryCell")
        tableView.register(UINib(nibName: "NameSettingTableViewCell", bundle: nil), forCellReuseIdentifier: "nameSettingCell")
        tableView.register(UINib(nibName: "PickerTableViewCell", bundle: nil), forCellReuseIdentifier: "pickerCell")
        tableView.register(UINib(nibName: "ReuseableLabelButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "labelButtonCell")
        self.imagePicker = ImagePicker(presentationController: self , delegate: self)
        

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstStoryCell", for: indexPath) as! firstCellTableViewCell
            cell.EmploymentStatus.isHidden = true
            cell.userName.isHidden = true
            cell.lineView.isHidden = true
            cell.lineViewEmployment.isHidden = true
            cell.userImageView.image = image;
            cell.contentView.addSubview(photoViewTappable)
            let tap = UITapGestureRecognizer(target: self, action: #selector(proceedToGetPhoto))
            photoViewTappable.addGestureRecognizer(tap)
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameSettingCell", for: indexPath) as! NameSettingTableViewCell
            cell.nameLabel.text = "Name"
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "pickerCell", for: indexPath) as! PickerTableViewCell
            cell.pickerLabel.text = "Employment Status"
            cell.pickerView.delegate = self
            cell.pickerView.dataSource = self
            cell.pickerView.tag = 0
            cell.pickerView.tintColor = .red

            return cell
        }else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "pickerCell", for: indexPath) as! PickerTableViewCell
            cell.pickerLabel.text = "Education"
            cell.pickerView.tag = 1
            cell.pickerView.delegate = self
            cell.pickerView.dataSource = self
            cell.pickerView.tintColor = .red
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "labelButtonCell", for: indexPath) as! ReuseableLabelButtonTableViewCell
            cell.reuseableLabel.text = " I Hate my Current Advisor "
            cell.reuseableButton.setTitle("Change My Advisor!", for: .normal)
            cell.reuseableButton.addTarget(self, action: #selector(goToAdvisorPage), for: .touchUpInside)
            
            return cell
        }
        
    }
    @objc func goToAdvisorPage(){
        performSegue(withIdentifier: "toAdvisor", sender: self)
        print("Change advisor needed!")
    }
    
    @objc func proceedToGetPhoto(_ sender: UIView){
        self.imagePicker.present(from: sender)
        print("next!")
    }
    
    func uiSetting(){
       // self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationItem.title = "Setting"
      //  self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePressed))
    }
    
    @objc func donePressed(){
        print("Done")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return 150
        }else if indexPath.row == 1{
            return 105
        }else if indexPath.row == 2{
            return 150
        }else if indexPath.row == 3{
            return 160
        }else{
            return 105
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = .clear
        return vw
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = .red
        return vw
    }

}

extension SettingTableViewController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
      //  self.imageView.image = image
        self.image = image!
        tableView.reloadData()
    }
    
}

extension SettingTableViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return EmploymentStatus.count
        }else{
            return Education.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0{
            return EmploymentStatus[row]
        }else{
            return Education[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0{
            print(EmploymentStatus[row])
        }else{
            print(Education[row])
        }
    }
    
}

