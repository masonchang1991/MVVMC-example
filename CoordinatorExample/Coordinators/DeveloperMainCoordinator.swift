//
//  DeveloperMainCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

class DeveloperMainCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainTabbarControlelr = MainTabbarController()
        
        let developerCoordinator1 = DeveloperCoordinator(navigationController: UINavigationController())
        childCoordinator.append(developerCoordinator1)
        developerCoordinator1.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        developerCoordinator1.delegate = self
        developerCoordinator1.start()
        
        let developerCoordinator2 = DeveloperCoordinator(navigationController: UINavigationController())
        childCoordinator.append(developerCoordinator2)
        developerCoordinator2.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        developerCoordinator2.delegate = self
        developerCoordinator2.start()
        
        let developerCoordinator3 = DeveloperCoordinator(navigationController: UINavigationController())
        childCoordinator.append(developerCoordinator3)
        developerCoordinator3.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        developerCoordinator3.delegate = self
        developerCoordinator3.start()
        
        mainTabbarControlelr.viewControllers = [developerCoordinator1.navigationController,
                                                developerCoordinator2.navigationController,
                                                developerCoordinator3.navigationController]
        
        self.navigationController.viewControllers = [mainTabbarControlelr]
    }
}

extension DeveloperMainCoordinator: DeveloperCoordinatorDelegate {
    func developerCoordinatorDidFinish(developerCoordinator: DeveloperCoordinator) {
        for (index, coordinator) in childCoordinator.enumerated() {
            if let coordinator = coordinator as? DeveloperCoordinator,
                coordinator === developerCoordinator {
                childCoordinator.remove(at: index)
                break
            }
        }
    }
}
