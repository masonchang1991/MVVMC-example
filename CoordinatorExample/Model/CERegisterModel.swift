//
//  CERegisterModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/19.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

class CERegisterModel: LoginAndRegisterModel {
    
    func register(account: String, password: String, completion: @escaping ((Error?) -> ())) {
        DispatchQueue.global().async {
            let appManager = AppManager.shared
            let localDataService = appManager.localDataService
            let user = UserAccount(account: account, password: password)
            if localDataService.checkIfUserIsExist(user) {
                DispatchQueue.main.async {
                    completion(NSError(domain: "register fail. User is exist",
                                       code: 401,
                                       userInfo: nil))
                }
            } else {
                DispatchQueue.main.async {
                    localDataService.registerUser(user)
                    completion(nil)
                }
            }
        }
    }
}
