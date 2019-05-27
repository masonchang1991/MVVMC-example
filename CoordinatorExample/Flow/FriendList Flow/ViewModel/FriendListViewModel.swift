//
//  FriendListViewModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

protocol FriendListViewModelViewDelegate: class {
    func friendListDidUpdate(viewModel: FriendListViewModel)
}

protocol FriendListViewModelCoordinatorDelegate: class {
    func goToFriendDetail(_ friend: Friend)
}

protocol FriendListViewModel {
    
    var model: FriendListModel? { get set }
    var viewDelegate: FriendListViewModelViewDelegate? { get set }
    var coordinatorDelegate: FriendListViewModelCoordinatorDelegate? { get set }
    
    var friends: [Friend] { get set }
    
    func getMyFriends()
    func tapFriendAt(_ indexPath: IndexPath)
}
