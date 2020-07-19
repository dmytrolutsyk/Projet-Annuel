//
//  ListingDetailViewController.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import UIKit

class ListingInfoViewController: UIViewController {

  
    @IBOutlet var listingPhoto: UIImageView!
    
    @IBOutlet weak var listingDate: UILabel!
    @IBOutlet weak var listingUsername: UILabel!
    @IBOutlet weak var listingCategory: UILabel!
    @IBOutlet weak var listingType: UILabel!
    @IBOutlet weak var listingDescription: UILabel!
    @IBOutlet weak var listingTitle: UILabel!
    var listing: Listing!
    let listingService: ListingService = ListingService()
    
    
    class func newInstance(listing: Listing) -> ListingInfoViewController {
        
        let listinginfo = ListingInfoViewController()
        listinginfo.listing = listing
        listinginfo.navigationItem.title = "Détail de l'Annonce"
            
        if let photoURL = URL(string: listing.photos!) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: photoURL)
                if let data = data {
                    let photo = UIImage(data: data)
                    DispatchQueue.main.async {
                        
                        listinginfo.listingTitle?.text = listing.title!
                        listinginfo.listingTitle.font = UIFont.boldSystemFont(ofSize: 27.0)
                        listinginfo.listingPhoto?.image = photo
                        listinginfo.listingType?.text = listing.listingtype!
                        listinginfo.listingCategory?.text = listing.category!
                        listinginfo.listingType?.text = listing.listingtype!
                        listinginfo.listingUsername?.text = listing.username!
                        listinginfo.listingDate?.text = listing.createdAt!
                        listinginfo.listingDescription?.text = listing.listingdescription!
                        listinginfo.listingDescription.font = UIFont.systemFont(ofSize: 20.0)

                    }
                }
                DispatchQueue.main.async {
                    
                }
            }
        }
        return listinginfo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
