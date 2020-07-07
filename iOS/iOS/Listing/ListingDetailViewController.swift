//
//  ListingDetailViewController.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import UIKit

class ListingDetailViewController: UIViewController {

    @IBOutlet var creatorPseudo: UILabel!
    @IBOutlet var creationDate: UILabel!
    @IBOutlet var requestDescription: UILabel!
    @IBOutlet var picture: UIImageView!
    var currentRequest: Listing!
    let requestServices: ListingService = ListingService()
    
    
    class func newInstance(listing: Listing) -> ListingDetailViewController {
        
        let requestlvc = ListingDetailViewController()
        requestlvc.currentRequest = listing
        requestlvc.navigationItem.title = listing.title!
            
        
        
        if let imageURL = URL(string: listing.photoPath!) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        requestlvc.picture?.image = image
                        requestlvc.creatorPseudo?.text = listing.psuedoUser!
                        requestlvc.creationDate?.text = listing.createAt!
                        requestlvc.requestDescription?.text = listing.Requestdescription!
                    }
                }
                DispatchQueue.main.async {
                    if (requestlvc.picture.image == nil){
                        
                        requestlvc.picture?.image = UIImage(named: "workshop")
                        requestlvc.creatorPseudo?.text = listing.psuedoUser!
                        requestlvc.creationDate?.text = listing.createAt!
                        requestlvc.requestDescription?.text = listing.Requestdescription!
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
