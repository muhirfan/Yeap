//
//  OnboardingProfileViewController.swift
//  Yeap
//
//  Created by Muhammad Irfan on 19/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit

class OnboardingProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var employmentPickerView: UIPickerView!
    @IBOutlet weak var educationPickerView: UIPickerView!
    
    var employmentStatus = ["Choose One","Unemployed","Employed"]
    var education = ["Choose One","Vocational High School","High School"]
    var selectedEducation: String = ""
    var selectedEmploymentStatus: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        employmentPickerView.delegate = self
        employmentPickerView.dataSource = self
        educationPickerView.delegate = self
        educationPickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1) {
            return employmentStatus.count
        } else {
            return education.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1) {
            return employmentStatus[row]
        } else {
            return education[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1){
            selectedEmploymentStatus =  employmentStatus[row]
        } else {
            selectedEducation = education[row]
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        UserDefaults.standard.set(selectedEmploymentStatus, forKey: "employmentStatus")
        UserDefaults.standard.set(selectedEducation, forKey: "education")
    }

}
