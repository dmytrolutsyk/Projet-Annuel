//
//  SignupViewController.swift
//  iOS
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    
    
    @IBOutlet weak var UserTypeSc: UISegmentedControl!
    
    var UserType: String = "Individual"
    
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print (UserType)

    }
    
    @IBAction func UserTypeTap(_ sender: UISegmentedControl) {
        let getUserType = UserTypeSc.selectedSegmentIndex
        
        print (getUserType)
        switch(getUserType){
        case 0:
            UserType = "Individual"
        case 1:
            UserType = "Charity"
        case 2:
            UserType = "Public Entity"
        default:
            print("error")
        }
        print (UserType)

    }

    
/*
    @IBAction func UserTypeSegmentedControl(_ sender: UISegmentedControl) {
        
        let getUserType = UserTypeSc.selectedSegmentIndex
        print (getUserType)
        switch(getUserType){
        case 0:
            UserType = "Individual"
        case 1:
            UserType = "Charity"
        case 2:
            UserType = "Public Entity"
        default:
            print("error")
        }
        print (UserType)
    }
     */
    
}
