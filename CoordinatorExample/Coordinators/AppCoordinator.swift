//
//  AppCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        //BaseNavigationController don't need the top bar
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    var isLogin: Bool {
        return false
    }
    
    func start() {
        if isLogin {
            
        } else {
            let loginCoordinator = LoginAndRegisterCoordinator(navigationController: navigationController)
            childCoordinator.append(loginCoordinator)
            loginCoordinator.delegate = self
            loginCoordinator.start()
        }
    }
}

extension AppCoordinator: LoginAndRegisterCoordinatorDelegate {
    
    func showMainByEntryType(_ type: LoginType) {
        switch type {
        case .developer: break
        case .normalSuccess:
            let normalMainCoordinator = NormalMainCoordinator(navigationController: navigationController)
            childCoordinator.append(normalMainCoordinator)
            normalMainCoordinator.start()
        case .error(let error): break
        }
    }
    
    func registerCoordinatorDidFinish(registerCoordinator: LoginAndRegisterCoordinator) {
            for (index, coordinator) in childCoordinator.enumerated() {
                if let coordinator = coordinator as? LoginAndRegisterCoordinator,
                    coordinator === registerCoordinator {
                    childCoordinator.remove(at: index)
                    coordinator.navigationController.popViewController(animated: false)
                    break
                }
            }
    }
    
    func loginCoordinatorDidFinish(loginCoordinator: LoginAndRegisterCoordinator) {
        for (index, coordinator) in childCoordinator.enumerated() {
            if let coordinator = coordinator as? LoginAndRegisterCoordinator,
                coordinator === loginCoordinator {
                childCoordinator.remove(at: index)
                coordinator.navigationController.popViewController(animated: false)
                break
            }
        }
    }
}
