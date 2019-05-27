//
//  FriendDetailViewModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

protocol FriendDetailViewModelViewDelegate: class {
    func friendDetailDidFriendDataChange(viewModel: FriendDetailViewModel, friend: Friend)
    func friendDetailFavoriteStateDidChange(viewModel: FriendDetailViewModel, isFavorite: Bool)
}

protocol FriendDetailViewModelCoordinatorDelegate: class {
    func friendDetailDidFinish(viewModel: FriendDetailViewModel)
}

protocol FriendDetailViewModel {
    
    var model: FriendDetailModel? { get set }
    var viewDelegate: FriendDetailViewModelViewDelegate? { get set }
    var coordinatorDelegate: FriendDetailViewModelCoordinatorDelegate? { get set }
    
    var isFavorite: Bool { get set }
    var friend: Friend { get set }
    
    func getCurrentFavoriteState()
    func detailDidFinish()
    func changeState()
}
