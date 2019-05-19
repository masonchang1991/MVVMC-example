//
//  CEFriendDetailViewModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

class CEFriendDetailViewModel: FriendDetailViewModel {
    
    var model: FriendDetailModel?
    var viewDelegate: FriendDetailViewModelViewDelegate?
    var coordinatorDelegate: FriendDetailViewModelCoordinatorDelegate?
    
    var isFavorite: Bool = false {
        didSet {
            if oldValue != isFavorite {
                viewDelegate?.friendDetailFavoriteStateDidChange(viewModel: self, isFavorite: isFavorite)
            }
        }
    }
    var friend: Friend {
        didSet {
            if oldValue != friend {
                viewDelegate?.friendDetailDidFriendDataChange(viewModel: self, friend: friend)
            }
        }
    }
    
    init(friend: Friend) {
        self.friend = friend
    }
    
    func getCurrentFavoriteState() {
        model?.getFriendFavoriteStatus(friend, completion: { [weak self] (isFavorite, error) in
            guard let self = self else { return }
            if let _ = error {
                
            } else {
                self.isFavorite = isFavorite
            }
        })
    }
    
    func changeState() {
        if isFavorite {
            model?.removeFriendFromFavorite(friend, completion: { [weak self] (error) in
                guard let self = self else { return }
                if let _ = error {
                    
                } else {
                    self.isFavorite = false
                }
            })
        } else {
            model?.addFriendToFavorite(friend, completion: { [weak self] (error) in
                guard let self = self else { return }
                if let _ = error {
                    
                } else {
                    self.isFavorite = true
                }
            })
        }
    }
    
    func detailDidFinish() {
        coordinatorDelegate?.friendDetailDidFinish(viewModel: self)
    }
}
