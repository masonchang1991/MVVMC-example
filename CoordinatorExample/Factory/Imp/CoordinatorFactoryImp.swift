//
//  CoordinatorFactoryImp.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/23.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

final class CoordinatorFactoryImp: CoordinatorFactory {
    
    func makeTabbarCoordinator() -> (configurator: Coordinator, toPresent: Presentable?) {
        let controller = TabbarController.instantiate()
        let coordinator = TabbarCoordinator(tabbarView: controller,
                                            coordinatorFactory: CoordinatorFactoryImp())
        return (coordinator, controller)
    }
    
    func makeAuthCoordinator(router: Router) -> AuthCoordinatorOutput & Coordinator {
        let loginCoordinator = LoginAndRegisterCoordinator(with: ModuleFactoryImp(), router: router)
        return loginCoordinator
    }
    
    func makeFriendListCoordinator(navController: UINavigationController?) -> Coordinator {
        let coordinator = FriendListCoordinator(router: router(navController),
                                                factory: ModuleFactoryImp(),
                                                coordinatorFactory: CoordinatorFactoryImp())
        return coordinator
    }
    
    func makeNormalViewCoordinator(navController: UINavigationController?) -> Coordinator {
        let coordinator = NormalCoordinator(with: ModuleFactoryImp(), router: router(navController))
        return coordinator
    }
    
    // return root vc is to hold the strong reference, because router's rootVC is weak reference
    func makeFriendDetailCoordinatorBox(with friend: Friend) -> (configurator: Coordinator & FriendDetailCoordinatorOutput, toPresent: Presentable?, rootViewController: UIViewController?) {
        return makeFriendDetailCoordinatorBox(with: friend, navController: navigationController(nil))
    }
    
    func makeFriendDetailCoordinatorBox(with friend: Friend, navController: UINavigationController?) ->
        (configurator: Coordinator & FriendDetailCoordinatorOutput,
        toPresent: Presentable?,
        rootViewController: UIViewController?) {
            let router = self.router(navController)
            let coordinator = FriendDetailCoordinator(with: ModuleFactoryImp(), router: router, friend: friend)
            return (coordinator, router, navController)
    }
    
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController {
            return navController
        } else {
            return BaseNav()
        }
    }
    
}
