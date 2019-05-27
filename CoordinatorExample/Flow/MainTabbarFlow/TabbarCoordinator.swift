//
//  NoramlMainCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

class TabbarCoordinator: BaseCoordinator {
    
    private let tabbarView: TabbarView
    private let coordinatorFactory: CoordinatorFactory
    
    init(tabbarView: TabbarView, coordinatorFactory: CoordinatorFactory) {
        self.tabbarView = tabbarView
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        tabbarView.onViewDidLoad = setupTabbarItem()
        tabbarView.tabbarItemSelectAt = runFlowBySelectIndex()
        
        
        
//        let mainTabbarControlelr = TabbarController()
//        
//        let friendListCoordinator = FriendListCoordinator(navigationController: UINavigationController())
//        childCoordinator.append(friendListCoordinator)
//        friendListCoordinator.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 3)
//        friendListCoordinator.start()
//        
//        let normalCoordinator = NormalCoordinator(navigationController: UINavigationController())
//        childCoordinator.append(normalCoordinator)
//        normalCoordinator.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
//        normalCoordinator.delegate = self
//        normalCoordinator.start()
//        
//        mainTabbarControlelr.viewControllers = [friendListCoordinator.navigationController,
//                                                normalCoordinator.navigationController]
//        
//        self.navigationController.viewControllers = [mainTabbarControlelr]
    }
    
    func setupTabbarItem() -> ((UITabBarController) -> ()) {
        return { [unowned self] (tabbarController) in
            let firstNavController = UINavigationController()
            let secondNavController = UINavigationController()
            tabbarController.viewControllers = [firstNavController, secondNavController]
            let firstFlow = self.runFriendListFlow()
            firstFlow(firstNavController)
            let normalFlow = self.runNormalViewFlow()
            normalFlow(secondNavController)
        }
    }
    
    func runFlowBySelectIndex() -> ((UINavigationController, Int) -> ()) {
        return { [unowned self] (navController, index) in
            switch index {
            case 0:
                let firstFlow = self.runFriendListFlow()
                firstFlow(navController)
            case 1:
                let normalFlow = self.runNormalViewFlow()
                normalFlow(navController)
            default:
                let firstFlow = self.runFriendListFlow()
                firstFlow(navController)
            }
        }
    }
    
    func runFriendListFlow() -> ((UINavigationController) -> ()){
        return { [unowned self] navController in
            if navController.viewControllers.isEmpty {
                let friendListCoordinator = self.coordinatorFactory.makeFriendListCoordinator(navController: navController)
                self.addDependency(friendListCoordinator)
                friendListCoordinator.start()
            }
        }
    }
    
    func runNormalViewFlow() -> ((UINavigationController) -> ()){
        return { [unowned self] navController in
            if navController.viewControllers.isEmpty {
                let normalViewCoordinator = self.coordinatorFactory.makeNormalViewCoordinator(navController: navController)
                self.addDependency(normalViewCoordinator)
                normalViewCoordinator.start()
            }
        }
    }
}

