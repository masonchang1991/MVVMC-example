//
//  FriendDetailModuleFactory.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/23.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

protocol FriendDetailModuleFactory {
    func makeFriendDetailVC(binding viewModel: FriendDetailViewModel) -> Presentable
}
