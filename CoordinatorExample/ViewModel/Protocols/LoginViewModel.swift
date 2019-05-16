//
//  LoginViewModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

protocol LoginViewModelViewDelegate: class {
    func canSubmitStatusDidChange(_ viewModel: LoginViewModel, status: Bool)
    func errorMessageDidChange(_ viewModel: LoginViewModel, message: String)
}

protocol LoginViewModelCoordinatorDelegate: class {
    func authenticateViewModelDidLogin(viewModel: LoginViewModel, type: LoginType)
}

protocol LoginViewModel {
    
    var model: LoginModel? { get set }
    var viewDelegate: LoginViewModelViewDelegate? { get set }
    var coordinatorDelegate: LoginViewModelCoordinatorDelegate? { get set }
    
    var account: String { get set }
    var password: String { get set }
    
    var canSubmit: Bool { get }
    
    var errorMessage: String { get }
    
    func submit()
}
