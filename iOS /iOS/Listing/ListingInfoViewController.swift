//
//  ListingDetailViewController.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import UIKit

class ListingInfoViewController: UIViewController {

    @IBOutlet var creatorPseudo: UILabel!
    @IBOutlet var creationDate: UILabel!
    @IBOutlet var requestDescription: UILabel!
    @IBOutlet var picture: UIImageView!
    var currentRequest: Listing!
    let requestServices: ListingService = ListingService()
    
    
    class func newInstance(listing: Listing) -> ListingInfoViewController {
        
        let listinginfo = ListingInfoViewController()
        listinginfo.currentRequest = listing
        listinginfo.navigationItem.title = listing.title!
            
        
        
        if let photoURL = URL(string: listing.photos!) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: photoURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        listinginfo.picture?.image = image
                        listinginfo.creatorPseudo?.text = listing.username!
                        listinginfo.creationDate?.text = listing.createdAt!
                        listinginfo.requestDescription?.text = listing.listingdescription!
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
