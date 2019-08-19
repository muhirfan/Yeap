//
//  OnboardingImageViewController.swift
//  Yeap
//
//  Created by Muhammad Irfan on 19/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import UIKit
import CoreData

class OnboardingImageViewController: UIViewController {

    @IBOutlet weak var imageTapable: UIView!
    @IBOutlet weak var choosePhoto: UIImageView!
    var imagePicker: ImagePicker!
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageTapable.backgroundColor = .clear
        
        let tap  = UITapGestureRecognizer(target: self, action: #selector(proceedToGetPhoto(_:)))
        imageTapable.addGestureRecognizer(tap)
        self.imagePicker = ImagePicker(presentationController: self , delegate: self)
        
    }
    
    @objc func proceedToGetPhoto(_ sender: UIView){
        self.imagePicker.present(from: sender)
    }
    
    @IBAction func onSaveClicked(_ sender: Any) {
        
    }
    
    @objc func savePhoto(){
        let object = CoreDataHelper.getModelObject(entityName: "Account")
//        object.setValue(edu, forKey: "education")
//        object.setValue(employmentStatus, forKey: "employmentStatus")
//        object.setValue(name, forKey: "fullName")
        
        if let image = self.image{
            let newImage = image.pngData()! as NSData
            object.setValue(newImage, forKey: "image")
        }
        CoreDataHelper.saveToCoreData()
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
extension OnboardingImageViewController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        self.image = image!
        self.choosePhoto.image = image
        viewDidLoad()
    }
    
}
