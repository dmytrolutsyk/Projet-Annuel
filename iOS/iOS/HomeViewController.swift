

import UIKit

class HomeViewController: UITabBarController {
    
  
    let listingServices: ListingService = ListingService()
    var listings:[Listing]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1)
        tabBar.barTintColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        self.navigationItem.setHidesBackButton(true, animated: true);
        setupTabBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    
     func setupTabBar() {
        
        self.listingServices.getListing { (listings) in
            print(listings)
            self.listings = listings
            let listingController = UINavigationController(rootViewController: ListingsCollectionViewController.newInstance(listings: listings))
            listingController.tabBarItem.image = UIImage(named: "")
            listingController.tabBarItem.title = "Annonces"
            
            let loginController = UINavigationController(rootViewController: LoginViewController())
            loginController.tabBarItem.image = UIImage(named: "")
            loginController.tabBarItem.title = "Login"
            
            let messagingController = UINavigationController(rootViewController: MessagingViewController())
            messagingController.tabBarItem.image = UIImage(named: "")
            messagingController.tabBarItem.title = "Messaging"
            
            let userController = UINavigationController(rootViewController: UserProfileViewController())
            userController.tabBarItem.image = UIImage(named: "")
            userController.tabBarItem.title = "User"
            
            self.viewControllers = [listingController, loginController,messagingController,userController]

        }
        
        
        
        }
}
