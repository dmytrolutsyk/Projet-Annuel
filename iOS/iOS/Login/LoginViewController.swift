//
//  LoginViewController.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var mail: UITextField!
    @IBOutlet var password: UITextField!
    
    
    let loginService: LoginService = LoginService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mail.delegate = self
        self.password.delegate = self

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         switch textField {
           case mail:
               password.becomeFirstResponder()
           case password:
                self.view.endEditing(true)
           default:
               textField.resignFirstResponder()
           }
           return false
    }
    
    @IBAction func login(_ sender: Any) {
        
        print("mail: \(String(describing: mail.text)), password: \(String(describing: password.text))")
        let date = Date()



        let user = User( email: mail.text ?? "test1@test.fr", password: password.text ?? "test2", type: "0", username: "String", phone: "String", city: "String" )
        
        self.loginService.login(user: user) { (success) in
            
            print("\(success)")
        }
        let home = HomeViewController()
        self.navigationController?.pushViewController(home, animated: true)
        
    }
   
    @IBAction func Signup(_ sender: UIButton) {
        let signup = SignupViewController()
        self.navigationController?.pushViewController(signup, animated: true)
    }
    
 
}
