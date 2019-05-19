//
//  LocalDataService.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/18.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

class LocalDataService {
    
    enum DataType {
        case friend
        case user([UserAccount])
    }
    
    var currentFavoriteFriends: [Friend] = [] {
        didSet {
            if oldValue != currentFavoriteFriends {
                save(type: .friend)
                //Notify observer
                NotificationCenter.default.post(name: NSNotification.Name.favoriteFriendsDidChange,
                                                object: nil)
            }
        }
    }
    
    init() {
        loadAllData()
    }
    
    private func loadAllData() {
        let defaults = UserDefaults.standard
        guard let savedData = defaults.data(forKey: "Friends") else {
            return
        }
        
        let decoder = JSONDecoder()
        
        guard let savedFriends = try? decoder.decode([Friend].self, from: savedData) else {
            return
        }
        self.currentFavoriteFriends = savedFriends
    }
    
    private func save(type: DataType) {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        
        switch type {
        case .friend:
            guard let savedData = try? encoder.encode(currentFavoriteFriends) else {
                fatalError("Unable to encode friends data.")
            }
            
            defaults.set(savedData, forKey: "Friends")
        case .user(let users):
            guard let saveData = try? encoder.encode(users) else {
                fatalError("Unable to encode users data.")
            }
            defaults.set(saveData, forKey: "Users")
        }
    }
    
    func checkIfUserIsExist(_ user: UserAccount) -> Bool {
        let defaults = UserDefaults.standard
        guard let savedData = defaults.data(forKey: "Users") else {
            return false
        }
        
        let decoder = JSONDecoder()
        
        guard let savedUsers = try? decoder.decode([UserAccount].self, from: savedData) else {
            return false
        }
        return savedUsers.contains(user)
    }
    
    func registerUser(_ user: UserAccount) {
        let defaults = UserDefaults.standard
        let decoder = JSONDecoder()
        guard
            let savedData = defaults.data(forKey: "Users"),
            var savedUsers = try? decoder.decode([UserAccount].self, from: savedData) else {
                // if no user in local, add one
                save(type: .user([user]))
            return
        }
        savedUsers.append(user)
        save(type: .user(savedUsers))
    }
    
    func addFavoriteFriend(_ friend: Friend, completion: @escaping ((_ isSuccess: Bool) -> ())) {
        if !currentFavoriteFriends.contains(friend) {
            var favoriteFriend = friend
            favoriteFriend.isFavorite = true
            currentFavoriteFriends.append(favoriteFriend)
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func removeFavoriteFriend(_ friend: Friend, completion: @escaping ((_ isSuccess: Bool) -> ())) {
        for (index, favoriteFriend) in currentFavoriteFriends.enumerated() {
            if favoriteFriend.name == friend.name {
                currentFavoriteFriends.remove(at: index)
                completion(true)
                return
            }
        }
        completion(false)
    }
    
}
