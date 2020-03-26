//
//  UpdateProfilePresenter.swift
//  mvpDemoMedium
//
//  Created by Ebrahim  Mo Gedamy on 3/26/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
import UIKit

class UpdateProfilePresenter {
    
    var user : User?
    var updateProfileViewController: UserProfileViewProtocol?
    
    init(user : User? , viewController : UserProfileViewProtocol) {
        self.user = user
        self.updateProfileViewController = viewController
        if let user = user {
            self.setUserData(user)
        }
    }
    
    func setUserData(_ user: User){
        self.updateProfileViewController?.setName(user.name)
        self.updateProfileViewController?.setMobile(user.mobileNumber)
        self.updateProfileViewController?.setEmail(user.email)
        self.updateProfileViewController?.setAge(user.age)
        self.updateProfileViewController?.setGender(atIndex: user.gender.rawValue)
    }
    
    func validateInput(name: String, mobileNumber: String, email: String) -> UpdateProfileFormError? {
        
        if name.isEmpty{
            return .emptyName
        }else if !validate(mobileNumber : mobileNumber){
            return .invalidMobileNumber
        }else if !validate(email: email){
            return .invalidEmailAddress
        }else if user?.age ?? 0 < 18 {
            return .veryYoung
        }else{
            return nil
        }
    }
    
    func validate(mobileNumber: String) -> Bool {
        let alphaNumericRegex = "^[0-9]*$"
        let alphaNumericTest = NSPredicate(format: "SELF MATCHES %@", alphaNumericRegex)
        return alphaNumericTest.evaluate(with: mobileNumber)
    }
    
    func validate(email: String) -> Bool {
        let regex = "([\\w-+]+(?:\\.[\\w-+]+)*@(?:[\\w-]+\\.)+[a-zA-Z]{2,7})"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailTest.evaluate(with: email)
    }
    
    func saveButtonClicked() {
        if let error = self.validateInput(name: self.updateProfileViewController?.getName() ?? "", mobileNumber: self.updateProfileViewController?.getMobileNumber() ?? "", email: self.updateProfileViewController?.getEmail() ?? ""){
            self.updateProfileViewController?.showAlert(withTitle: "Error", andErrorMessage: error.localizedDescription)
        }else{
            self.saveProfileData(name: self.updateProfileViewController?.getName() ?? "", mobileNumber: self.updateProfileViewController?.getMobileNumber() ?? "", gender: Gender(rawValue: self.updateProfileViewController?.getGenderIndex() ?? 0)!)
            self.updateProfileViewController?.showAlert(withTitle: "Success", andErrorMessage: "The profile updated successfully")
        }
    }
   
   func saveProfileData(name: String, mobileNumber: String, gender: Gender) {
        
        self.updateLocalStoreWithUserData(name: name, mobileNumber: mobileNumber, gender: gender)
        self.updateUserModel(name: name, mobileNumber: mobileNumber, gender: gender)
    }
    
    func updateLocalStoreWithUserData(name: String, mobileNumber: String, gender: Gender) {
        // update local data
        LocalStorage.default.user?.name = name
        LocalStorage.default.user?.mobileNumber = mobileNumber
        LocalStorage.default.user?.gender = gender
    }
    
    func updateUserModel(name: String, mobileNumber: String, gender: Gender) {
        // update the model
        self.user?.name = name
        self.user?.mobileNumber = mobileNumber
        self.user?.gender = gender
    }
}
