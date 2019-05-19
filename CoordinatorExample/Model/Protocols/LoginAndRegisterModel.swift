//
//  LoginModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

enum LoginType {
    case normalSuccess
    case developer
    case error(Error?)
}

protocol LoginAndRegisterModel {
    func login(account: String, password: String, completionHandler: @escaping (_ type: LoginType) -> ())
    func register(account: String, password: String, completion: @escaping ((Error?) -> ()))
}

extension LoginAndRegisterModel {
    func login(account: String, password: String, completionHandler: @escaping (_ type: LoginType) -> ()) {
        
    }
    func register(account: String, password: String, completion: @escaping ((Error?) -> ())) {
        
    }
}
