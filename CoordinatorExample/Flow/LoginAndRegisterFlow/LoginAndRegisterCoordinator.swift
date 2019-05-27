//
//  LoginCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

protocol AuthCoordinatorOutput: class {
    var finishFlow: (() -> ())? { get set }
}

class LoginAndRegisterCoordinator: BaseCoordinator, AuthCoordinatorOutput {
    
    enum StartType {
        case login
        case register
    }
    
    private let factory: AuthModuleFactory
    private let router: Router
    
    var startType: StartType = .login
    var finishFlow: (() -> ())?
    
    init(with factory: AuthModuleFactory, router: Router) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        switch startType {
        case .login:
            let viewModel = CELoginViewModel()
            viewModel.model = CELoginModel()
            viewModel.coordinatorDelegate = self
            let loginVC = factory.makeLoginVC(binding: viewModel)
            router.push(loginVC)
        case .register:
            let viewModel = CERegisterViewModel()
            viewModel.model = CERegisterModel()
            viewModel.coordinatorDelegate = self
            let registerVC = factory.makeRegisterVC(binding: viewModel)
            router.push(registerVC)
        }
    }
}

extension LoginAndRegisterCoordinator: LoginAndRegisterViewModelCoordinatorDelegate {
    func goToRegisterPage() {
        let viewModel = CERegisterViewModel()
        viewModel.model = CERegisterModel()
        viewModel.coordinatorDelegate = self
        let registerVC = factory.makeRegisterVC(binding: viewModel)
        router.push(registerVC)
    }
    
    func backToLoginPage() {
        self.router.popModule()
    }
    
    func authenticateViewModelDidRegister(viewModel: LoginAndRegisterViewModel) {
        self.router.popModule()
    }
    
    func authenticateViewModelDidLogin(viewModel: LoginAndRegisterViewModel, type: LoginType) {
        finishFlow?()
    }
}

