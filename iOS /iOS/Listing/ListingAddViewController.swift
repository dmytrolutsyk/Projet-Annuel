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
        navigationItem.title = "Publier une Annonce"
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
               defautPhoto = "https://www.cesarsway.com/wp-content/uploads/2019/06/AdobeStock_219922748-1024x682.jpeg"
            case "Bricolage":
               defautPhoto = "https://i.pinimg.com/736x/a6/94/dd/a694ddafd90fd951a0a077cd186b3849--etagere-garage-dewalt.jpg"
            case "Electroménager":
               defautPhoto = "https://www.maisonapart.com/images/auto/640-480-c/20180228_170750_thinkstockphotos-513631128ok.jpg"
            case "Informatique":
               defautPhoto = "https://www.digischool.fr/images/article/le-master-informatique-lg-36795.jpg"
            case "Instruments de Musique":
               defautPhoto = "https://www.thomann.de/blog/wp-content/uploads/2017/09/Quiz_instrument_header_770x425_b.jpg"
            case "Jardinage":
               defautPhoto = "https://www.jardiner-malin.fr/wp-content/uploads/2020/03/Coronavirus-jardinage.jpg"
            case "Jeux & Jouets":
               defautPhoto = "https://www.pacamomes.com/wp-content/uploads/2018/11/remise-en-jeux.jpg"
            case "Mobilier":
               defautPhoto = "https://www.lescuisinesdarno.com/Images/amenagement-interieur/mobilier/mobilier-design-contemporain-Lyon.jpg"
            case "Multimédia":
               defautPhoto = "https://degreesncareers.com/wp-content/uploads/2017/06/design-multimedia-1024x576.jpg"
            case "Sport":
               defautPhoto = "https://www.sportmonde.com/wp-content/uploads/2020/04/sport.jpg"
            case "Véhicules":
               defautPhoto = "https://www.forms-surfaces.com/sites/default/files/imagecache/gal-reg-2x/images/5.5.2_bike_garden_setting_4057_05152012_1.jpg"
            case "Vêtements":
               defautPhoto = "https://images.unsplash.com/photo-1512436991641-6745cdb1723f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
            default:
                print("error")
            }
        }
        else {
            userPhoto = true
        }
        
        
       let formatter = DateFormatter()
       formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
       let String = formatter.string(from: Date())
       let date = formatter.date(from: String)
       let now = formatter.string(from: date!)
       print(now)
        
        if(TitleEdit.text == "" || DescriptionEdit.text == "" ) {
                        let alertController = UIAlertController(title: "Attention", message: "Veuillez remplir tous les champs", preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                      } else {
            
            
                  
            
            if (userPhoto){
            let listing = Listing( category: listingCategory, userID:"", username: "", phoneNumber: "", photos: photoEdit.text, title: TitleEdit.text, listingdescription: DescriptionEdit.text, listingtype: listingType, city: "", createdAt: now, mail: "" )
                self.listingService.addListing(listing: listing) { (success) in
                    print("\(success)")
                }
            }
            else {
                let listing = Listing( category: listingCategory, userID:"", username: "", phoneNumber: "", photos: defautPhoto, title: TitleEdit.text, listingdescription: DescriptionEdit.text, listingtype: listingType, city: "", createdAt: now, mail: "" )
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
