//
//  HomeViewController.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {
    
  
    let listingServices: ListingService = ListingService()
    var listings:[Listing]?
    
    override func viewDidLoad() {
               super.viewDidLoad()
               view.backgroundColor = UIColor.white
               self.navigationController?.isNavigationBarHidden = true
               var navigationBarAppearace = UINavigationBar.appearance()
               navigationBarAppearace.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
               navigationBarAppearace.barTintColor = UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1)
               self.navigationItem.setHidesBackButton(true, animated: true);
               setupTabBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
     func setupTabBar() {
        
            self.listingServices.getListing { (listings) in
            self.listings = listings
            let listingController = UINavigationController(rootViewController: ListingsCollectionViewController.newInstance(listings: listings))
            listingController.tabBarItem.image = UIImage(named: "Annonce")
            listingController.tabBarItem.title = "Annonces"
            
            let favouriteController = UINavigationController(rootViewController: FavouriteListingViewController())
            favouriteController.tabBarItem.image = UIImage(named: "Favoris")
            favouriteController.tabBarItem.title = "Favoris"
            
            let listingaddController = UINavigationController(rootViewController: ListingAddViewController())
            listingaddController.tabBarItem.image = UIImage(named: "Publier")
            listingaddController.tabBarItem.title = "Publier"
            
            let messagingController = UINavigationController(rootViewController: MessagingViewController())
            messagingController.tabBarItem.image = UIImage(named: "Messages")
            messagingController.tabBarItem.title = "Messages"
                
            let userinfoController = UINavigationController(rootViewController: UserProfileViewController())
            userinfoController.tabBarItem.image = UIImage(named: "Compte")
            userinfoController.tabBarItem.title = "Compte"
      
                self.viewControllers = [listingController, favouriteController, listingaddController, messagingController, userinfoController]

            
        }
        
        }

}
