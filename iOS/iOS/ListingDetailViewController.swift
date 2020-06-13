//
//  ListingDetailViewController.swift
//  iOS
//
//  Created by Norman on 02/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import UIKit

class ListingDetailViewController: UIViewController {

    @IBOutlet var creatorPseudo: UILabel!
    @IBOutlet var creationDate: UILabel!
    @IBOutlet var listingDescription: UILabel!
    @IBOutlet var picture: UIImageView!
    @IBAction func saved(_ sender: UIButton) {
        print("saved")
    }
    
    var currentListintg: Listing!
    let listingServices: ListingService = ListingService()
    
    
    class func newInstance(listing: Listing) -> ListingDetailViewController {
        
        let requestlvc = ListingDetailViewController()
        requestlvc.currentListintg = listing
        requestlvc.navigationItem.title = listing.title!
            
        
        
        if let imageURL = URL(string: listing.photoPath!) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        requestlvc.picture?.image = image
                        requestlvc.creatorPseudo?.text = listing.pseudo!
                        requestlvc.creationDate?.text = listing.createAt!
                        requestlvc.listingDescription?.text = listing.Listingdescription!
                    }
                }
                DispatchQueue.main.async {
                    if (requestlvc.picture.image == nil){
                        
                      //  requestlvc.picture?.image = UIImage(named: "workshop")
                        requestlvc.creatorPseudo?.text = listing.pseudo!
                        requestlvc.creationDate?.text = listing.createAt!
                        requestlvc.listingDescription?.text = listing.Listingdescription!
                    }
                }
            }
        }
        return requestlvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.red

    }
   
   

}
