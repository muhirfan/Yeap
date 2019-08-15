//
//  SettingTableViewController.swift
//  Yeap
//
//  Created by Agatha Rachmat on 07/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit
import CoreData

class SettingTableViewController: UITableViewController {
    var EmploymentStatus = ["Choose One","Unemployed","Employed"]
    var Education = ["Choose One","Vocational High School","High School"]
 
    struct Account {
        var name : String
        var employmentStatus :  String
        var education : String
        var image : UIImage
    }
    
    var imagePicker: ImagePicker!
    var image : UIImage?
    var employmentStatus = ""
    var employmentIndex : [Int]?
    var educationIndex : [Int]?
    var edu = ""
    var name : String?
    var nameContainer : String?
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadFromData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetting()        
        tableView.register(UINib(nibName: "firstCellTableViewCell", bundle: nil), forCellReuseIdentifier: "firstStoryCell")
        tableView.register(UINib(nibName: "NameSettingTableViewCell", bundle: nil), forCellReuseIdentifier: "nameSettingCell")
        tableView.register(UINib(nibName: "PickerTableViewCell", bundle: nil), forCellReuseIdentifier: "pickerCell")
        tableView.register(UINib(nibName: "ReuseableLabelButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "labelButtonCell")
        self.imagePicker = ImagePicker(presentationController: self , delegate: self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
        
    }
    
    private func loadFromData(){
        let result = CoreDataHelper.fetchCoreData(entityName: "Account")
        print("tes \(result)")
        for data in result as! [NSManagedObject] {
           
            image = UIImage(data: data.value(forKey: "image") as! Data)!
            name = (data.value(forKey: "fullName") as? String) ?? ""
            employmentStatus = (data.value(forKey: "employmentStatus") as? String)!
            edu = (data.value(forKey: "education") as? String)!
            employmentIndex = EmploymentStatus.indexes(of: employmentStatus)
            educationIndex = Education.indexes(of: edu)
        }
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
            let tap = UITapGestureRecognizer(target: self, action: #selector(proceedToGetPhoto))
            cell.tappableView.addGestureRecognizer(tap)
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameSettingCell", for: indexPath) as! NameSettingTableViewCell
            cell.nameLabel.text = "Name"
            cell.nameTextField.text = name
            
            cell.returnValue = { value in
                self.name = value
            }
           cell.nameTextField.addTarget(self, action: #selector(SettingTableViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
           // cell.nameTextField.tag = 0
           
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "pickerCell", for: indexPath) as! PickerTableViewCell
            cell.pickerLabel.text = "Employment Status"
            cell.pickerView.delegate = self
            cell.pickerView.dataSource = self
            cell.pickerView.tag = 0
            cell.pickerView.tintColor = .red
            cell.pickerView.selectRow(employmentIndex?[0] ?? 0, inComponent: 0, animated: true)

            return cell
        }else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "pickerCell", for: indexPath) as! PickerTableViewCell
            cell.pickerLabel.text = "Education"
            cell.pickerView.tag = 1
            cell.pickerView.delegate = self
            cell.pickerView.dataSource = self
            cell.pickerView.tintColor = .red
            cell.pickerView.selectRow(educationIndex?[0] ?? 0, inComponent: 0, animated: true)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "labelButtonCell", for: indexPath) as! ReuseableLabelButtonTableViewCell
            cell.reuseableLabel.text = " Choose your Advisor "
            cell.reuseableButton.setTitle("I hate my current advisor", for: .normal)
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
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        name = textField.text
        
    }

    
    func uiSetting(){
       // self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationItem.title = "Settings"
        self.navigationController?.hidesBarsOnSwipe = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(donePressed))
    }
    
    private func saveToCoreData() {
        let object = CoreDataHelper.getModelObject(entityName: "Account")
        object.setValue(edu, forKey: "education")
        object.setValue(employmentStatus, forKey: "employmentStatus")
        object.setValue(name, forKey: "fullName")
        
        if let image = self.image{
            let newImage = image.pngData()! as NSData
            object.setValue(newImage, forKey: "image")
        }
        CoreDataHelper.saveToCoreData()
        
    }
    
    @objc func donePressed(){
        saveToCoreData()
        self.navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return 150
        }else if indexPath.row == 1{
            return 100
        }else if indexPath.row == 2{
            return 135
        }else if indexPath.row == 3{
            return 135
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
        vw.backgroundColor = .clear
        return vw
    }

}

extension SettingTableViewController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
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
            employmentStatus = EmploymentStatus[row]
        }else{
            edu = Education[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if pickerView.tag == 0{
            let titleData = EmploymentStatus[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont.TextStyle.caption1])
            return myTitle
            
        }else{
            let titleData = Education[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont.TextStyle.caption1 ,NSAttributedString.Key.foregroundColor:UIColor.black])
            return myTitle
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label = view as! UILabel?
        if label == nil {
            label = UILabel()
        }
         if pickerView.tag == 0{
        var data = EmploymentStatus[row]
        let title = NSAttributedString(string: data, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.regular)])
            label?.attributedText = title
         }else{
            var data = Education[row]
            let title = NSAttributedString(string: data, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.regular)])
            label?.attributedText = title
        }
        
        label?.textAlignment = .center
        return label!
        
    }
    
}

extension Array where Element: Equatable {
    func indexes(of element: Element) -> [Int] {
        return self.enumerated().filter({ element == $0.element }).map({ $0.offset })
    }
}
