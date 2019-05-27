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

    private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()
    
    var rootController: UINavigationController {
        
        let navController = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return self.window!.rootViewController as! UINavigationController
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        applicationCoordinator.start(with: nil)
        
        AppManager.active()
        
        return true
    }
    
    private func makeCoordinator() -> Coordinator {
        return AppCoordinator(
            router: RouterImp(rootController: self.rootController),
            coordinatorFactory: CoordinatorFactoryImp()
        )
    }
}

