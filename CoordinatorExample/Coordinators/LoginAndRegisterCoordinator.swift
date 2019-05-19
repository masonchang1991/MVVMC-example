//
//  LoginCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

protocol LoginAndRegisterCoordinatorDelegate: class {
    func loginCoordinatorDidFinish(loginCoordinator: LoginAndRegisterCoordinator)
    func registerCoordinatorDidFinish(registerCoordinator: LoginAndRegisterCoordinator)
    func showMainByEntryType(_ type: LoginType)
}

class LoginAndRegisterCoordinator: Coordinator {
    
    enum StartType {
        case login
        case register
    }
    
    weak var delegate: LoginAndRegisterCoordinatorDelegate?
    
    var childCoordinator: [Coordinator] = []
    
    unowned var navigationController: UINavigationController
    
    var startType: StartType = .login
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        switch startType {
        case .login:
            let loginVC = LoginAndRegisterViewController.instantiate()
            let viewModel = CELoginViewModel()
            viewModel.model = CELoginModel()
            viewModel.coordinatorDelegate = self
            loginVC.viewModel = viewModel
            self.navigationController.pushViewController(loginVC, animated: false)
        case .register:
            let registerVC = LoginAndRegisterViewController.instantiate()
            let viewModel = CERegisterViewModel()
            viewModel.model = CERegisterModel()
            viewModel.coordinatorDelegate = self
            registerVC.viewModel = viewModel
            self.navigationController.pushViewController(registerVC, animated: false)
        }
    }
}

extension LoginAndRegisterCoordinator: LoginAndRegisterViewModelCoordinatorDelegate {
    func goToRegisterPage() {
        let registerCoordinator = LoginAndRegisterCoordinator(navigationController: navigationController) 
        registerCoordinator.startType = .register
        registerCoordinator.start()
    }
    
    func backToLoginPage() {
        self.navigationController.popViewController(animated: false)
    }
    
    func authenticateViewModelDidRegister(viewModel: LoginAndRegisterViewModel) {
        delegate?.registerCoordinatorDidFinish(registerCoordinator: self)
    }
    
    func authenticateViewModelDidLogin(viewModel: LoginAndRegisterViewModel, type: LoginType) {
        delegate?.loginCoordinatorDidFinish(loginCoordinator: self)
        delegate?.showMainByEntryType(type)
    }
}

