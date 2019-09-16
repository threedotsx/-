//
//  UserViewController.swift
//  YoungAfisha
//
//  Created by руслан on 8/9/19.
//  Copyright © 2019 руслан. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userSeNameTextField: UITextField!
    @IBOutlet weak var userAgeTextField: UITextField!
    @IBOutlet weak var userAdressTextField: UITextField!
    @IBOutlet weak var userMaleTextField: UITextField!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

      let userDefaults = UserDefaults.standard
        userNameTextField.text = userDefaults.object(forKey: "FirstName") as? String
        userSeNameTextField.text = userDefaults.object(forKey: "SeName") as? String
        userAgeTextField.text = userDefaults.object(forKey: "Age") as? String
        userAdressTextField.text = userDefaults.object(forKey: "Adress") as? String
        userMaleTextField.text = userDefaults.object(forKey: "Male") as? String
    }
    
    @IBAction func CreateUserInformation(_ sender: AnyObject) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(userNameTextField.text, forKey: "FirstName")
        userDefaults.set(userSeNameTextField.text, forKey: "SeName")
        userDefaults.set(userAgeTextField.text, forKey: "Age")
        userDefaults.set(userAdressTextField.text, forKey: "Adress")
        userDefaults.set(userMaleTextField.text, forKey: "Male")
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
