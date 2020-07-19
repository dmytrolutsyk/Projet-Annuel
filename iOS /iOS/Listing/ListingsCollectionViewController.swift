//
//  ListingsCollectionViewController.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import UIKit

class ListingsCollectionViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    
    @IBOutlet var collectionView: UICollectionView!
    

    let listingServices: ListingService = ListingService()
    var listings = [Listing]()
    class func newInstance(listings: [Listing]) -> ListingsCollectionViewController {
        let listingcollection = ListingsCollectionViewController()
        listingcollection.listings = listings
        return listingcollection
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Annonces Disponibles"
        collectionView.delegate = self
        collectionView.dataSource = self
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ListingCollectionViewCell", bundle: bundle)
        collectionView.register(nib, forCellWithReuseIdentifier: "listingCell")
    
    }
    
    func ListingInCollection() {
        self.listingServices.getListing { (listings) in
            self.listings = listings
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        ListingInCollection()
        navigationItem.searchController?.searchBar.isHidden = false
    }
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          let listinginfo = ListingInfoViewController.newInstance(listing: listings[indexPath.row])
         
          self.navigationController?.pushViewController(listinginfo, animated: true)
      }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listingCell", for: indexPath) as! ListingCollectionViewCell
        
        cell.title!.text = listings[indexPath.row].title
        cell.title!.font = UIFont.boldSystemFont(ofSize: 16.0)
        if let photoURL = URL(string: listings[indexPath.row].photos!) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: photoURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.photo?.image = image
                    }
                }
            }
        }
        return cell
    }

  
}

