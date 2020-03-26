//
//  ViewController+Extension.swift
//  mvpDemoMedium
//
//  Created by Ebrahim  Mo Gedamy on 3/26/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
import UIKit

extension ViewController : UserProfileViewProtocol {
    func setName(_ name: String) {
        self.nameTxtField.text = name
    }
    
    func setMobile(_ mobile: String) {
        self.phoneNumTxtField.text = mobile
    }
    
    func setEmail(_ email: String) {
        self.emailTxtField.text = email
    }
    
    func setAge(_ age: Int) {
        self.ageTxtField.text = String(age)
    }
    
    func setGender(atIndex index: Int) {
        self.genderSegmentedController.selectedSegmentIndex = index
    }
    
    func getName() -> String {
        return self.nameTxtField.text ?? ""
    }
    
    func getMobileNumber() -> String {
        return self.phoneNumTxtField.text ?? ""
    }
    
    func getEmail() -> String {
        return self.emailTxtField.text ?? ""
    }
    
    func getAge() -> Int {
        return Int(self.ageTxtField.text ?? "0") ?? 0
    }
    
    func getGenderIndex() -> Int {
        return self.genderSegmentedController.selectedSegmentIndex
    }
    
    func showAlert(withTitle title: String, andErrorMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
