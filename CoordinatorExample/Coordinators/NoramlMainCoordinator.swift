//
//  NoramlMainCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

class NormalMainCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainTabbarControlelr = MainTabbarController()
        
        let normalCoordinator1 = NormalCoordinator(navigationController: UINavigationController())
        childCoordinator.append(normalCoordinator1)
        normalCoordinator1.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        normalCoordinator1.delegate = self
        normalCoordinator1.start()
        
        let normalCoordinator2 = NormalCoordinator(navigationController: UINavigationController())
        childCoordinator.append(normalCoordinator2)
        normalCoordinator2.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        normalCoordinator2.delegate = self
        normalCoordinator2.start()
        
        let normalCoordinator3 = NormalCoordinator(navigationController: UINavigationController())
        childCoordinator.append(normalCoordinator3)
        normalCoordinator3.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        normalCoordinator3.delegate = self
        normalCoordinator3.start()
        
        mainTabbarControlelr.viewControllers = [normalCoordinator1.navigationController,
                                                normalCoordinator2.navigationController,
                                                normalCoordinator3.navigationController]
        
        self.navigationController.viewControllers = [mainTabbarControlelr]
    }
}

extension NormalMainCoordinator: NormalCoordinatorDelegate {
    func normalCoordinatorDidFinish(normalCoordinator: NormalCoordinator) {
        for (index, coordinator) in childCoordinator.enumerated() {
            if let coordinator = coordinator as? NormalCoordinator,
                coordinator === normalCoordinator {
                childCoordinator.remove(at: index)
                break
            }
        }
    }
}
