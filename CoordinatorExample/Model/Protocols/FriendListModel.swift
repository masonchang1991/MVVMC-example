//
//  FriendListModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

protocol FriendListModel {
    func getFriends(_ completion: @escaping (([Friend]) -> ()))
}
