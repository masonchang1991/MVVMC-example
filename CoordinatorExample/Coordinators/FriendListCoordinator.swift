//
//  FriendListCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

class FriendListCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let friendListVC = FriendListTableViewController.instantiate()
        let viewModel = CEFriendListViewModel()
        viewModel.coordinatorDelegate = self
        viewModel.model = CEFriendListModel()
        friendListVC.viewModel = viewModel
        self.navigationController.pushViewController(friendListVC,
                                                     animated: false)
    }
}
extension FriendListCoordinator: FriendListViewModelCoordinatorDelegate {
    
    func goToFriendDetail(_ friend: Friend) {
        let friendDetailCoordinator = FriendDetailCoordinator(navigationController: navigationController,
                                                              friend: friend)
        friendDetailCoordinator.delegate = self
        childCoordinator.append(friendDetailCoordinator)
        friendDetailCoordinator.start()
    }
}

extension FriendListCoordinator: FriendDetailCoordinatorDelegate {
    func friendDetailCoordinatorDidFinish(coordinator: FriendDetailCoordinator) {
        for (index, childC) in childCoordinator.enumerated() {
            if let detailCoordinator = childC as? FriendDetailCoordinator,
                detailCoordinator === coordinator {
                coordinator.navigationController.popViewController(animated: false)
                childCoordinator.remove(at: index)
                break
            }
        }
    }
}
