//
//  SignInViewController.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import UIKit
class SignupViewController: UIViewController {
   
    
    @IBOutlet weak var usernameText: UILabel!
    @IBOutlet var passwordText: UILabel!
    @IBOutlet weak var passworconfirmText: UILabel!
    
    
    @IBOutlet var usernameEdit: UITextField!
    @IBOutlet var passwordEdit: UITextField!
    @IBOutlet weak var passwordconfirmEdit: UITextField!
    
  
    let signupService: SignupService = SignupService()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
 
    @IBAction func confirm(_ sender: UIButton) {
                     
              var a = false
              var b = false
        
        if(usernameEdit.text == "" || passwordEdit.text == "" || passwordconfirmEdit.text == "") {
          let alertController = UIAlertController(title: "Attention", message: "Veuillez remplir tous les champs", preferredStyle: .alert)
          let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
          alertController.addAction(defaultAction)
          self.present(alertController, animated: true, completion: nil)
        } else {

            a = true
        }
        
              if passwordEdit.text == passwordconfirmEdit.text {
                  b = true
              } else {

                     let alertController = UIAlertController(title: "Attention", message: "Les mots de passe sont différents", preferredStyle: .alert)
                                   let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                   alertController.addAction(defaultAction)
                                   self.present(alertController, animated: true, completion: nil)
              }

              

              if a == true && b == true {

                     guard let username = self.usernameEdit.text,
                                          let password = self.passwordEdit.text
                                          else {
                                            return
                                    }
                                    
                              let user = User(email: username, password: password)
                                    
                                    self.signupService.signup(user: user) { (success) in
                                        print("\(success)")
                                    }
                                        self.navigationController?.pushViewController(LoginViewController(), animated: true)
                                    }
              }
        
                  
    }
    

    



