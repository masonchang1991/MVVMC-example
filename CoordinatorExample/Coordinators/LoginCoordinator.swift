//
//  LoginCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

protocol LoginCoordinatorDelegate: class {
    func loginCoordinatorDidFinish(loginCoordinator: LoginCoordinator)
    func showMainByEntryType(_ type: LoginType)
}

class LoginCoordinator: Coordinator {
    
    weak var delegate: LoginCoordinatorDelegate?
    
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let loginVC = LoginViewController.instantiate()
        let viewModel = CELoginViewModel()
        viewModel.model = CELoginModel()
        viewModel.coordinatorDelegate = self
        loginVC.viewModel = viewModel
        self.navigationController.pushViewController(loginVC, animated: false)
    }
}

extension LoginCoordinator: LoginViewModelCoordinatorDelegate {
    func authenticateViewModelDidLogin(viewModel: LoginViewModel, type: LoginType) {
        delegate?.loginCoordinatorDidFinish(loginCoordinator: self)
        delegate?.showMainByEntryType(type)
    }
}


