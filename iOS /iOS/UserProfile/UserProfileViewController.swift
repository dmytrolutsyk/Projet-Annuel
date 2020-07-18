//
//  UserProfileViewController.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import UIKit
//, UIPickerViewDelegate, UIPickerViewDataSource
class UserProfileViewController: UIViewController {
 
    
    @IBOutlet var usernameTxt: UILabel!
    @IBOutlet var passwordTxt: UILabel!
    @IBOutlet var firstnameTxt: UILabel!
    @IBOutlet var nameTxt: UILabel!
    @IBOutlet var emailTxt: UILabel!
    
    @IBOutlet var usernameEditText: UITextField!
    @IBOutlet var passwordEditText: UITextField!
    @IBOutlet var phoneEditText: UITextField!
    @IBOutlet var cityEditText: UITextField!
    @IBOutlet var emailEditText: UITextField!
    @IBOutlet weak var usertypeSc: UISegmentedControl!
    
    
    let userWebService: UserService = UserService()
    
    var usertype: String = "Particulier"

  
    @IBAction func usertypeTap(_ sender: UISegmentedControl) {
        let getUserType = usertypeSc.selectedSegmentIndex
           
               switch(getUserType){
               case 0:
                   usertype = "Particulier"
               case 1:
                   usertype = "Association"
               case 2:
                   usertype = "Entitié Publique"
               default:
                   print("error")
               }
        print (usertype)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navigationItem.title = "Informations Utilisateur"
        
        
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    

    @IBAction func confirme(_ sender: UIButton) {
        guard let email = self.emailEditText.text,
                 let password = self.passwordEditText.text,
                 let username = self.usernameEditText.text,
                 let firstname = self.phoneEditText.text,
                 let city = self.cityEditText.text
                 else {
                   return
           }
           
        
        let type = usertype

        
           let user = User(email: email, password: password, type: type, username: username, phone: firstname, city: city)
           
           self.userWebService.newUser(user: user) { (success) in
               print("\(success)")
        }
        
            let alertController = UIAlertController(title: "Confirmation", message: "Les Informations ont été mis à jour", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)

            self.usernameEditText.text = ""
            self.passwordEditText.text = ""
            self.emailEditText.text = ""
            self.phoneEditText.text = ""
            self.cityEditText.text = ""
            usertypeSc.selectedSegmentIndex = 0
        
    }
    

    @IBAction func disconnect(_ sender: UIButton) {
    
        
    
        
        let refreshAlert = UIAlertController(title: "Attention", message: "Voulez vous vraiment déconnecter votre compte?", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Déconnexion", style: .default, handler: { (action: UIAlertAction!) in
              self.navigationController?.pushViewController(LoginViewController(), animated: true)
        }))

        refreshAlert.addAction(UIAlertAction(title: "annuler", style: .cancel, handler: { (action: UIAlertAction!) in
        }))

        present(refreshAlert, animated: true, completion: nil)
                
        self.navigationController?.pushViewController(LoginViewController(), animated: true)

    }
    

}
