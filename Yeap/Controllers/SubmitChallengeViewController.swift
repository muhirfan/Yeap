//
//  SubmitChallengeViewController.swift
//  Yeap
//
//  Created by Muhammad Irfan on 09/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit

class SubmitChallengeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 
    @IBAction func onCancelClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSaveClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
