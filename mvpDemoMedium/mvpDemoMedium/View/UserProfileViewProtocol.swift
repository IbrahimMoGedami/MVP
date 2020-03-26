//
//  UserProfileViewProtocol.swift
//  mvpDemoMedium
//
//  Created by Ebrahim  Mo Gedamy on 3/26/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation
import UIKit

protocol UserProfileViewProtocol : class{
    func setName(_ name: String)
    func setMobile(_ mobile: String)
    func setEmail(_ email: String)
    func setAge(_ age: Int)
    func setGender(atIndex index: Int)
    func getName() -> String
    func getMobileNumber() -> String
    func getEmail() -> String
    func getAge() -> Int
    func getGenderIndex() -> Int
    func showAlert(withTitle title: String, andErrorMessage message: String)
}
