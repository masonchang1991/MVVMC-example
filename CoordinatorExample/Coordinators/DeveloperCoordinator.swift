//
//  DeveloperCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

protocol DeveloperCoordinatorDelegate: class {
    func developerCoordinatorDidFinish(developerCoordinator: DeveloperCoordinator)
}

class DeveloperCoordinator: Coordinator {
    
    weak var delegate: DeveloperCoordinatorDelegate?
    
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let developerVC = DevelopViewController.instantiate()
        let viewModel = CEDeveloperViewModel()
        viewModel.model = CEDeveloperModel()
        viewModel.coordinatorDelegate = self
        developerVC.viewModel = viewModel
        self.navigationController.pushViewController(developerVC, animated: false)
    }
}

extension DeveloperCoordinator: DeveloperViewModelCoordinatorDelegate {
    func functionOne(viewModel: DeveloperViewModel) {
        let developerCoordinator = DeveloperCoordinator(navigationController: navigationController)
        childCoordinator.append(developerCoordinator)
        developerCoordinator.delegate = self
        developerCoordinator.start()
    }
}

extension DeveloperCoordinator: DeveloperCoordinatorDelegate {
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
