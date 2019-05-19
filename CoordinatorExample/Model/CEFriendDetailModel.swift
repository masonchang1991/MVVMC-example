//
//  CEFriendDetailModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

class CEFriendDetailModel: FriendDetailModel {
    
    func getFriendFavoriteStatus(_ friend: Friend, completion: @escaping ((Bool, Error?) -> ())) {
        let localDataService = AppManager.shared.localDataService
        completion(localDataService.currentFavoriteFriends.contains(friend), nil)
    }
    
    func addFriendToFavorite(_ friend: Friend, completion: @escaping ((Error?) -> ())) {
        let localDataService = AppManager.shared.localDataService
        localDataService.addFavoriteFriend(friend) { (isSuccess) in
            if isSuccess {
                completion(nil)
            } else {
                completion(NSError(domain: "addFavoriteFriend.fail",
                                   code: 1,
                                   userInfo: nil))
            }
        }
    }
    
    func removeFriendFromFavorite(_ friend: Friend, completion: @escaping ((Error?) -> ())) {
        let localDataService = AppManager.shared.localDataService
        localDataService.removeFavoriteFriend(friend) { (isSuccess) in
            if isSuccess {
                completion(nil)
            } else {
                completion(NSError(domain: "item not exist.",
                                   code: 0,
                                   userInfo: nil))
            }
        }
    }
}
