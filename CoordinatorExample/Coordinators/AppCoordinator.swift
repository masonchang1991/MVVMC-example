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
    }
    
    var isLogin: Bool {
        return false
    }
    
    func start() {
        if isLogin {
            
        } else {
            let loginCoordinator = LoginCoordinator(navigationController: navigationController)
            childCoordinator.append(loginCoordinator)
            loginCoordinator.delegate = self
            loginCoordinator.start()
        }
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func showMainByEntryType(_ type: LoginType) {
        switch type {
        case .developer:
            let developerMainCoordinator = DeveloperMainCoordinator(navigationController: navigationController)
            childCoordinator.append(developerMainCoordinator)
            developerMainCoordinator.start()
        case .normalSuccess:
            let normalMainCoordinator = NormalMainCoordinator(navigationController: navigationController)
            childCoordinator.append(normalMainCoordinator)
            normalMainCoordinator.start()
        case .error(let error): break
        }
    }
    
    func loginCoordinatorDidFinish(loginCoordinator: LoginCoordinator) {
        for (index, coordinator) in childCoordinator.enumerated() {
            if let coordinator = coordinator as? LoginCoordinator,
                coordinator === loginCoordinator {
                childCoordinator.remove(at: index)
                break
            }
        }
    }
}
