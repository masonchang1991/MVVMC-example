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
    
    unowned var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainTabbarControlelr = MainTabbarController()
        
        let friendListCoordinator = FriendListCoordinator(navigationController: UINavigationController())
        childCoordinator.append(friendListCoordinator)
        friendListCoordinator.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 3)
        friendListCoordinator.start()
        
        let normalCoordinator = NormalCoordinator(navigationController: UINavigationController())
        childCoordinator.append(normalCoordinator)
        normalCoordinator.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        normalCoordinator.delegate = self
        normalCoordinator.start()
        
        mainTabbarControlelr.viewControllers = [friendListCoordinator.navigationController,
                                                normalCoordinator.navigationController]
        
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
