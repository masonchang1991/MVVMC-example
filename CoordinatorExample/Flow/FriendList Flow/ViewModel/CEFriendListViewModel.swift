//
//  CEFriendListViewModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

class CEFriendListViewModel: FriendListViewModel {
    
    var model: FriendListModel?
    weak var viewDelegate: FriendListViewModelViewDelegate?
    weak var coordinatorDelegate: FriendListViewModelCoordinatorDelegate?
    
    var friends: [Friend] = [] {
        didSet {
            self.viewDelegate?.friendListDidUpdate(viewModel: self)
        }
    }
    
    init() {
        addObserver()
    }
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateFriendFavoriteList),
                                               name: Notification.Name.favoriteFriendsDidChange,
                                               object: nil)
    }
    
    private func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func updateFriendFavoriteList() {
        getFavoriteListAndUpdateCurrentList()
    }
    
    func getMyFriends() {
        model?.getFriends({ [weak self] (friends) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.friends = friends
                self.getFavoriteListAndUpdateCurrentList()
            }
        })
    }
    
    private func getFavoriteListAndUpdateCurrentList() {
        let localDataService = AppManager.shared.localDataService
        let currentFavorite = localDataService.currentFavoriteFriends
        friends = friends.map({ (friend) -> Friend in
            for favoriteFriend in currentFavorite {
                if favoriteFriend.name == friend.name { return favoriteFriend }
            }
            var notFavoriteFriend = friend
            notFavoriteFriend.isFavorite = false
            return notFavoriteFriend
        })
    }
    
    func tapFriendAt(_ indexPath: IndexPath) {
        let friend = friends[indexPath.row]
        coordinatorDelegate?.goToFriendDetail(friend)
    }
    
    deinit {
        removeObserver()
    }
}
