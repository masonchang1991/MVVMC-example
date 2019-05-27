//
//  AppCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

fileprivate var isAutorized = false

enum LaunchInStructor {
    case auth
    case main
    
    static func configure(isAutorized: Bool = isAutorized) -> LaunchInStructor {
        switch (isAutorized) {
        case (true): return .main
        case (false): return .auth
        }
    }
}

class AppCoordinator: BaseCoordinator {
    
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    private var instructor: LaunchInStructor {
        return LaunchInStructor.configure()
    }
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start(with option: DeepLinkOption?) {
        //Start with deeplink
        if let option = option {
            switch option {
               
            }
            
        // Default start
        } else {
            switch instructor {
            case .main:
                runMainFlow()
            case .auth:
                runAuthFlow()
            }
        }
    }
    
    func runAuthFlow() {
        let coordinator = coordinatorFactory.makeAuthCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            guard
                let self = self,
                let coordinator = coordinator else  { return }
            isAutorized = true
            self.start()
            self.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    func runMainFlow() {
        let (coordinator, module) = coordinatorFactory.makeTabbarCoordinator()
        addDependency(coordinator)
        router.setRootModule(module)
        coordinator.start()
    }
}
