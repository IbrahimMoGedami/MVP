//
//  ViewController.swift
//  mvpDemoMedium
//
//  Created by Ebrahim  Mo Gedamy on 3/26/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//
/// the ViewController responsibilities are reduced compared to MVC. The ViewController now is responsible for only UI functions like updating UI, animation, presenting views, …etc.

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var ageTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var phoneNumTxtField: UITextField!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet var genderSegmentedController: UISegmentedControl!
    @IBOutlet weak var saveBu: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveBu.layer.cornerRadius = 10.0
        let user = LocalStorage.default.user
        self.updateProfilePresenter = UpdateProfilePresenter(user: user, viewController: self)
    }
    
    var updateProfilePresenter : UpdateProfilePresenter?


    @IBAction func saveBuTapped(_ sender: UIButton) {
        self.updateProfilePresenter?.saveButtonClicked()
    }
}

