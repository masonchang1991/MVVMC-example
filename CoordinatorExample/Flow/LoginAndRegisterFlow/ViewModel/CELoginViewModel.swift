//
//  CELoginViewModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

class CELoginViewModel: LoginAndRegisterViewModel {

    var title: String = "Login"
    
    var model: LoginAndRegisterModel?
    weak var viewDelegate: LoginAndRegisterViewModelViewDelegate?
    weak var coordinatorDelegate: LoginAndRegisterViewModelCoordinatorDelegate?
    
    fileprivate var accountIsValidFormat: Bool = false
    var account: String = "" {
        didSet {
            if oldValue != account {
                let oldCanSubmit = canSubmit
                accountIsValidFormat = validateAccountFormat(account)
                if canSubmit != oldCanSubmit {
                    // change canSubmit status at view
                    viewDelegate?.canSubmitStatusDidChange(self, status: canSubmit)
                }
            }
        }
    }
    var accountPlaceholder: String = "enter your account"
    
    fileprivate var passwordIsValidFormat: Bool = false
    var password: String = "" {
        didSet {
            if oldValue != password {
                let oldCanSubmit = canSubmit
                passwordIsValidFormat = validatePasswordFormat(password)
                if canSubmit != oldCanSubmit{
                    // change canSubmit status at view
                    viewDelegate?.canSubmitStatusDidChange(self, status: canSubmit)
                }
            }
            
            
        }
    }
    var passwordPlaceholder: String = "enter yout password"
    
    var goToAnotherPageButtonTitle: String = "No account? Register now!"
    
    var canSubmit: Bool {
        return accountIsValidFormat && passwordIsValidFormat
    }
    
    private(set) var errorMessage: String = "" {
        didSet {
            if oldValue != errorMessage {
                // notify view to show error message
                viewDelegate?.errorMessageDidChange(self, message: errorMessage)
            }
        }
    }
    
    func submit() {
        errorMessage = ""
        guard let dataModel = model, canSubmit else {
            errorMessage = NSLocalizedString("can't submit", comment: "")
            return
        }
        
        let modelCompletionHandler = { (type: LoginType) in
            // Make sure on the main thread
            DispatchQueue.main.async {
                switch type {
                case .developer:
                    self.coordinatorDelegate?.authenticateViewModelDidLogin(viewModel: self, type: type)
                case .normalSuccess:
                    self.coordinatorDelegate?.authenticateViewModelDidLogin(viewModel: self, type: type)
                case .error(let error):
                    self.errorMessage = "not exist"
                }
            }
        }
        // Call Model to execute login
        dataModel.login(account: account, password: password, completionHandler: modelCompletionHandler)
    }
    
    func goToAnotherPage() {
        self.coordinatorDelegate?.goToRegisterPage()
    }
    
    /// Validate account is at least 6 characters
    private func validateAccountFormat(_ account: String) -> Bool {
        let trimmedString = account.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return trimmedString.count > 5
    }
    
    /// Validate password is at least 6 characters
    private func validatePasswordFormat(_ password: String) -> Bool {
        let trimmedString = password.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return trimmedString.count > 5
    }
    
}
