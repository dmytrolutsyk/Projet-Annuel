//
//  AppDelegate.swift
//  Find & Trade
//
//  Created by Norman on 27/05/2020.
//  Copyright © 2020 Find&Trade. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        var navigationBarAppearace = UINavigationBar.appearance()

        navigationBarAppearace.tintColor = UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1)
        navigationBarAppearace.barTintColor = UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController =  UINavigationController(rootViewController: HomeViewController())
        window.makeKeyAndVisible()
        self.window = window

        return true
        
    }



}

