//
//  FriendDetailModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

protocol FriendDetailModel {
    func addFriendToFavorite(_ friend: Friend, completion: @escaping ((Error?) -> ()))
    func removeFriendFromFavorite(_ friend: Friend, completion: @escaping ((Error?) -> ()))
    func getFriendFavoriteStatus(_ friend: Friend, completion: @escaping ((_ isFavorite: Bool, _ error: Error?) -> ()))
}
