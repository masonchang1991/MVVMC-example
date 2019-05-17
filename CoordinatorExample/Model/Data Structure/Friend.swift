//
//  Friend.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

struct Friend: Codable, Equatable {
    var name: String = "New Friend"
    
    static func fakeFriends() -> [Friend] {
        let url = Bundle.main.url(forResource: "friends", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        return try! decoder.decode([Friend].self, from: data)
    }
    
    static func ==(lefe: Friend, right: Friend) -> Bool {
        return lefe.name == right.name 
    }
}
