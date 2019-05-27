//
//  LoginViewModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

protocol LoginAndRegisterViewModelViewDelegate: class {
    func canSubmitStatusDidChange(_ viewModel: LoginAndRegisterViewModel, status: Bool)
    func errorMessageDidChange(_ viewModel: LoginAndRegisterViewModel, message: String)
}

protocol LoginAndRegisterViewModelCoordinatorDelegate: class {
    func authenticateViewModelDidLogin(viewModel: LoginAndRegisterViewModel, type: LoginType)
    func authenticateViewModelDidRegister(viewModel: LoginAndRegisterViewModel)
    func goToRegisterPage()
    func backToLoginPage() 
}

protocol LoginAndRegisterViewModel {
    
    var title: String { get set }
    
    var model: LoginAndRegisterModel? { get set }
    var viewDelegate: LoginAndRegisterViewModelViewDelegate? { get set }
    var coordinatorDelegate: LoginAndRegisterViewModelCoordinatorDelegate? { get set }
    
    var account: String { get set }
    var password: String { get set }
    
    var accountPlaceholder: String { get set }
    var passwordPlaceholder: String { get set }
    
    var goToAnotherPageButtonTitle: String { get set }
    
    var canSubmit: Bool { get }
    
    var errorMessage: String { get }
    
    func submit()
    func goToAnotherPage()
}
