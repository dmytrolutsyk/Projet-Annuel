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
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        tabBar.barTintColor = UIColor(red: 38/255, green: 196/255, blue: 133/255, alpha: 1)
        self.navigationItem.setHidesBackButton(true, animated: true);
        setupTabBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    
     func setupTabBar() {
        
            self.listingServices.getListing { (listings) in
            self.listings = listings
            
            let listingController = UINavigationController(rootViewController: ListingsCollectionViewController.newInstance(listings: listings))
            listingController.tabBarItem.image = UIImage(named: "")
            listingController.tabBarItem.title = "Annonces"
            
            let userinfoController = UINavigationController(rootViewController: UserProfileViewController())
            userinfoController.tabBarItem.image = UIImage(named: "")
            userinfoController.tabBarItem.title = "Profil"
            
            let messagingController = UINavigationController(rootViewController: MessagingViewController())
            messagingController.tabBarItem.image = UIImage(named: "")
            messagingController.tabBarItem.title = "Messages"
            
          //  let userController = UINavigationController(rootViewController: UserProfileViewController())
           // userController.tabBarItem.image = UIImage(named: "")
           // userController.tabBarItem.title = "User"
            
          //  self.viewControllers = [listingController, loginController,messagingController,userController]
                self.viewControllers = [listingController, userinfoController,messagingController]

            
        }
        
        }

}
