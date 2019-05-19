//
//  AppDelegate.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navController = UINavigationController()
        appCoordinator = AppCoordinator(navigationController: navController)
        appCoordinator.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        AppManager.active()
        
        return true
    }
}

