//
//  LoginViewController.swift
//  iOS
//
//  Created by Norman on 24/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self._Username.delegate = self
        self._Password.delegate = self
    }


    
    
    let loginService: LoginService = LoginService()
    
    
    @IBOutlet weak var _Username: UITextField!
    @IBOutlet weak var _Password: UITextField!
    @IBOutlet weak var _Button: UIButton!
    
    
    @IBAction func ConfirmButton(_ sender: UIButton) {
        
        let home = HomeViewController()
        self.navigationController?.pushViewController(home, animated: true)
        
        print("Username: \(String(describing: _Username.text!))")
        print("Password: \(String(describing: _Password.text!))")
        print(Date())
        let date = Date()

        let user = User(_id: nil, username: _Username.text ?? "test1@test.fr", password: _Password.text ?? "test2", type: "0", pseudo: "String", firstname: "String", lastname: "String", birthdate: date.debugDescription , sex: true, photo: "String", requestIssued: 0, requestFulfilled: 0 )
        
        self.loginService.login(user: user) { (success) in
        
            print("\(success)")
        }
}
    
    @IBAction func SignupButton(_ sender: UIButton) {
        let signup = SignupViewController()
        self.navigationController?.pushViewController(signup, animated: true)
    }
    
  
    
}


