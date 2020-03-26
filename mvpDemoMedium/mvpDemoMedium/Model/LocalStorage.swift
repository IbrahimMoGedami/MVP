//
//  LocalStorage.swift
//  mvpDemoMedium
//
//  Created by Ebrahim  Mo Gedamy on 3/26/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import Foundation

class LocalStorage {
    
    var user: User?
    static let `default` = LocalStorage() // usage of singelton
    
    private init() {
        user = getUser()
    }
    
    // get the user from remote or from local, based on your business
    private func getUser() -> User? {
        return User(name: "Ebrahim Mo Gedamy", mobileNumber: "01021577475", email: "hemagedamy@gmail.com", age: 22, gender: .male)
    }
}
