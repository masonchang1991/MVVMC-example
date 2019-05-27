//
//  ViewController.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import UIKit

class LoginAndRegisterViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginOrRegisterButton: UIButton!
    
    @IBOutlet weak var goToAnotherPageButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    var viewModel: LoginAndRegisterViewModel? {
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
            loginOrRegisterButton.isEnabled = viewModel.canSubmit
        } else {
            accountTextField.text = ""
            passwordTextField.text = ""
            errorMessageLabel.text = ""
            loginOrRegisterButton.isEnabled = false
        }
    }
    
    private func setupViews() {
        title = viewModel?.title
        loginOrRegisterButton.setTitle(viewModel?.title, for: .normal)
        accountTextField.placeholder = viewModel?.accountPlaceholder
        passwordTextField.placeholder = viewModel?.passwordPlaceholder
        goToAnotherPageButton.setTitle(viewModel?.goToAnotherPageButtonTitle,
                                       for: .normal)
    }
    
    private func setupActions() {
        accountTextField.addTarget(self, action: #selector(accountFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordFieldDidChange(_:)), for: .editingChanged)
        loginOrRegisterButton.addTarget(self, action: #selector(loginBtnPress(_:)), for: .touchUpInside)
        goToAnotherPageButton.addTarget(self, action: #selector(goToAnotherPage(_:)), for: .touchUpInside)
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
    
    @objc private func goToAnotherPage(_ sender: UIButton) {
        viewModel?.goToAnotherPage()
    }
    
    deinit {
        print(classForCoder.self, "dealloc")
    }
}

extension LoginAndRegisterViewController: LoginAndRegisterViewModelViewDelegate {
    
    func canSubmitStatusDidChange(_ viewModel: LoginAndRegisterViewModel, status: Bool) {
        loginOrRegisterButton.isEnabled = status
    }
    
    func errorMessageDidChange(_ viewModel: LoginAndRegisterViewModel, message: String) {
        errorMessageLabel.text = message
    }
}
