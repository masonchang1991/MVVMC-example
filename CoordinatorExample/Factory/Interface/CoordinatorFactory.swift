//
//  CoordinatorFactory.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/22.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

protocol CoordinatorFactory {
    
    func makeTabbarCoordinator() -> (configurator: Coordinator, toPresent: Presentable?)
    
    func makeAuthCoordinator(router: Router) -> Coordinator & AuthCoordinatorOutput
    
    func makeFriendListCoordinator(navController: UINavigationController?) -> Coordinator
    
    func makeNormalViewCoordinator(navController: UINavigationController?) -> Coordinator
    
    func makeFriendDetailCoordinatorBox(with friend: Friend) -> (configurator: Coordinator & FriendDetailCoordinatorOutput, toPresent: Presentable?, rootViewController: UIViewController?)
}
