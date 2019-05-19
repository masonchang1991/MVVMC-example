//
//  CELoginModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

class CELoginModel: LoginAndRegisterModel {
    
    func login(account: String, password: String, completionHandler: @escaping (LoginType) -> ()) {
        // Model always use aysnchronous
        let localDataService = AppManager.shared.localDataService
        let user = UserAccount(account: account, password: password)
        if localDataService.checkIfUserIsExist(user) {
            completionHandler(.normalSuccess)
        } else {
            completionHandler(.error(nil))
        }
    }
}
