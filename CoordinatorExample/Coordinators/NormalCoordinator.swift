//
//  NormalCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

protocol NormalCoordinatorDelegate: class {
    func normalCoordinatorDidFinish(normalCoordinator: NormalCoordinator)
}

class NormalCoordinator: Coordinator {
    
    // talk to its parent "I'm finished"
    weak var delegate: NormalCoordinatorDelegate?
    
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let normalVC = NormalViewController.instantiate()
        let viewModel = CENormalViewModel()
        viewModel.coordinatorDelegate = self
        viewModel.model = CENormalModel()
        normalVC.viewModel = viewModel
        self.navigationController.pushViewController(normalVC, animated: false)
    }
}

extension NormalCoordinator: NormalViewModelCoordinatorDelegate {
    func none() {
        
    }
}
