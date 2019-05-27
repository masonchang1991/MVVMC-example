//
//  BaseCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/22.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        start(with: nil)
    }
    
    func start(with option: DeepLinkOption?) {
        
    }
    
    func addDependency(_ coordinator: Coordinator) {
        guard !childCoordinators.contains(where: {$0 === coordinator}) else { return }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator else {
                return
        }
        
        //Clear child-Coordinators recursively
        if let coordinator = coordinator as? BaseCoordinator,
            !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter( {$0 !== coordinator })
                .forEach({ coordinator.removeDependency($0)})
        }
        for (index, element) in childCoordinators.enumerated() where coordinator === element {
            childCoordinators.remove(at: index)
            break
        }
    }
}
