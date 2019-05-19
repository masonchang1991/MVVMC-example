//
//  AppManager.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/18.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

class AppManager {
    
    private init() { }
    
    static let shared = AppManager()
    
    var localDataService: LocalDataService = LocalDataService()
    
    static func active() {
        let _ = AppManager.shared
    }
    
}
