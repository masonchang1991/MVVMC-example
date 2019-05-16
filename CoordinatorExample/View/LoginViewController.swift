//
//  ViewController.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    var viewModel: LoginViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
            // RefreshView
            if oldValue != nil {
                refreshDisplay()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupActions()
        refreshDisplay()
    }

    func refreshDisplay() {
        if let viewModel = viewModel {
            accountTextField.text = viewModel.account
            passwordTextField.text = viewModel.password
            errorMessageLabel.text = viewModel.errorMessage
            loginButton.isEnabled = viewModel.canSubmit
        } else {
            accountTextField.text = ""
            passwordTextField.text = ""
            errorMessageLabel.text = ""
            loginButton.isEnabled = false
        }
    }
    
    private func setupViews() {
        title = "Login"
        accountTextField.placeholder = "enter your account"
        passwordTextField.placeholder = "enter yout password"
    }
    
    private func setupActions() {
        accountTextField.addTarget(self, action: #selector(accountFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordFieldDidChange(_:)), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(loginBtnPress(_:)), for: .touchUpInside)
    }
    
    @objc private func accountFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            viewModel?.account = text
        }
    }
    
    @objc private func passwordFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            viewModel?.password = text
        }
    }
    
    @objc private func loginBtnPress(_ sender: UIButton) {
        viewModel?.submit()
    }
}

extension LoginViewController: LoginViewModelViewDelegate {
    
    func canSubmitStatusDidChange(_ viewModel: LoginViewModel, status: Bool) {
        loginButton.isEnabled = status
    }
    
    func errorMessageDidChange(_ viewModel: LoginViewModel, message: String) {
        errorMessageLabel.text = message
    }
}
