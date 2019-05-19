//
//  User.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/19.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

struct UserAccount: Codable, Equatable {
    var account: String
    var password: String
    
    static func ==(left: UserAccount, right: UserAccount) -> Bool {
        if left.account == right.account && left.password == right.password {
            return true
        } else {
            return false
        }
    }
}
