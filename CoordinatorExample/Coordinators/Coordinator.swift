//
//  Coordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
    func startByWindow(_ window: UIWindow)
}

extension Coordinator {
    func startByWindow(_ window: UIWindow) {
        
    }
}
