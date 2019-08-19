//
//  OnboardingNameViewController.swift
//  Yeap
//
//  Created by Muhammad Irfan on 19/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit

class OnboardingNameViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        nameTextField.text = UserDefaults.standard.string(forKey: "fullName")
    }
    
    @IBAction func onNameChanged(_ sender: Any) {
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
        UserDefaults.standard.set(nameTextField.text, forKey: "fullName")
    }

}
