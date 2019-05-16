//
//  CELoginModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

class CELoginModel: LoginModel {
    
    func login(account: String, password: String, completionHandler: @escaping (LoginType) -> ()) {
        // Model always use aysnchronous
        DispatchQueue.global().async {
            if account == "developer" && password == "112233" {
                completionHandler(.developer)
            } else if account == "mason001" && password == "112233" {
                completionHandler(.normalSuccess)
            } else {
                let error = NSError(domain: "CE",
                                    code: 1,
                                    userInfo: [NSLocalizedDescriptionKey: "Invalid Account or Password"])
                completionHandler(.error(error))
            }
        }
    }
}
