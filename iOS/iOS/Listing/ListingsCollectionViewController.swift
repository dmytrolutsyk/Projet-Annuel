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
    private var listings = [Listing]()
    var filterTableData = [Listing]()
    let filtertableCount = 0;
    var resultSearchController = UISearchController()


    var TableData = [Listing]()
    
    
    class func newInstance(listings: [Listing]) -> ListingsCollectionViewController {
        
        let requestlvc = ListingsCollectionViewController()
        requestlvc.listings = listings
        requestlvc.TableData = listings
        return requestlvc
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Annonces"
        collectionView.delegate = self
        collectionView.dataSource = self
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ListingCollectionViewCell", bundle: bundle)
        collectionView.register(nib, forCellWithReuseIdentifier: "COLLECTION_CELL_IDENTIFER")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        navigationController?.title = "Annonces"
    
    }
    
    func ListingInCollection() {
        self.listingServices.getListing { (listings) in
            self.listings = listings
            self.TableData = listings
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("why not")
        ListingInCollection()
        navigationItem.searchController?.searchBar.isHidden = false
    }
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "COLLECTION_CELL_IDENTIFER", for: indexPath) as! ListingCollectionViewCell
        
        cell.title!.text = listings[indexPath.row].title
        cell.user!.text = listings[indexPath.row].psuedoUser
        cell.user!.textColor = UIColor.white
        cell.user!.backgroundColor = UIColor.darkGray
        
        cell.picture?.image = UIImage(named: "annonce")
        
        if let imageURL = URL(string: listings[indexPath.row].photoPath!) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.picture?.image = image
                    }
                }
            }
        }
        return cell
    }

    @objc func addTapped() {
        
        
              print("add")
             
          }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("go to")
        let vc = ListingDetailViewController.newInstance(listing: listings[indexPath.row])
       
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
extension UIViewController : UISearchBarDelegate {
    

    func makeBlackNavigationbar (viewController: UIViewController, animated: Bool) {

        viewController.navigationController?.navigationBar.backgroundColor? = UIColor.black

           let searchBar = UISearchBar()
            searchBar.placeholder = "Chercher"
            searchBar.delegate = viewController
            viewController.navigationItem.titleView = searchBar
    }}
    
    func setSearchControllerDelegate(viewController: UIViewController, navigationItem : UINavigationItem)
    {
        
        navigationItem.searchController!.searchBar.delegate = viewController
        
    }
