//
//  ListingAddViewController.swift
//  Find & Trade
//
//  Created by Norman on 06/07/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import UIKit

class ListingAddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    let category: NSArray = ["Animaux","Bricolage","Electroménager","Informatique", "Instruments de Musique", "Jardinage", "Jeux & Jouets", "Mobilier", "Multimédia", "Sport", "Véhicules", "Vêtements"]
    var selected = ""

  
    
    let listingService: ListingService = ListingService()


    @IBOutlet weak var catLabel: UILabel!
    @IBOutlet weak var TitleEdit: UITextField!
    @IBOutlet weak var DescriptionEdit: UITextField!
    @IBOutlet weak var typeSg: UISegmentedControl!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var photoEdit: UITextField!
    
    var listingType: String = "Particulier"

    @IBAction func typeTap(_ sender: UISegmentedControl) {
        let getListingType = typeSg.selectedSegmentIndex
                  
                      switch(getListingType){
                      case 0:
                          listingType = "Don"
                      case 1:
                          listingType = "Echange"
                      default:
                          print("error")
                      }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        selected = category[0] as! String
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return category.count
      }
      
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return category[row] as? String
      }
     
      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected = category[row] as! String
    }
    
    
    
   
    
    @IBAction func confirm(_ sender: UIButton) {
        let listingCategory = selected
        var defautPhoto = ""
        var userPhoto = false
        
        if(photoEdit.text == ""){
            switch listingCategory {
            case "Animaux":
               defautPhoto = "animalol"
            case "Bricolage":
               defautPhoto = ""
            case "Electroménager":
               defautPhoto = ""
            case "Informatique":
               defautPhoto = ""
            case "Instruments de Musique":
               defautPhoto = ""
            case "Jardinage":
               defautPhoto = ""
            case "Jeux & Jouets":
               defautPhoto = ""
            case "Mobilier":
               defautPhoto = ""
            case "Multimédia":
               defautPhoto = ""
            case "Sport":
               defautPhoto = ""
            case "Véhicules":
               defautPhoto = "https://s1.1zoom.me/b5050/819/Peugeot_308_White_White_background_512805_3840x2400.jp"
            case "Vêtements":
               defautPhoto = ""
            default:
                print("error")
            }
        }
        else {
            userPhoto = true
        }
        
        
        if(TitleEdit.text == "" || DescriptionEdit.text == "" ) {
                        let alertController = UIAlertController(title: "Attention", message: "Veuillez remplir tous les champs", preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                      } else {
            
            
                   print("Titre: \(String(describing: TitleEdit.text)), Description: \(String(describing: DescriptionEdit.text))")
            
            if (userPhoto){
            let listing = Listing( category: listingCategory, userID:"", username: "", phoneNumber: "", photos: photoEdit.text, title: TitleEdit.text, listingdescription: DescriptionEdit.text, listingtype: "", city: "", createdAt: "", mail: "" )
                self.listingService.addListing(listing: listing) { (success) in
                    print("\(success)")
                }
            }
            else {
                let listing = Listing( category: listingCategory, userID:"", username: "", phoneNumber: "", photos: defautPhoto, title: TitleEdit.text, listingdescription: DescriptionEdit.text, listingtype: "", city: "", createdAt: "", mail: "" )
                self.listingService.addListing(listing: listing) { (success) in
                    print("\(success)")
                }
            }
            
        let alerttitle = self.TitleEdit.text!
            
            let alertController = UIAlertController(title: "Confirmation", message: "Votre Annonce '\(alerttitle)' a bien été publiée", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)

            self.TitleEdit.text = ""
            self.DescriptionEdit.text = ""
            self.photoEdit.text = ""
            //categoryPicker= 0
            typeSg.selectedSegmentIndex = 0
            
            
        
        }
    }
    
   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
