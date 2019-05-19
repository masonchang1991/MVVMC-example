//
//  FriendDetailCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

protocol FriendDetailCoordinatorDelegate: class {
    func friendDetailCoordinatorDidFinish(coordinator: FriendDetailCoordinator)
}

class FriendDetailCoordinator: Coordinator {
    
    weak var delegate: FriendDetailCoordinatorDelegate?
    var childCoordinator: [Coordinator] = []
    unowned var navigationController: UINavigationController
    var friend: Friend
    
    
    init(navigationController: UINavigationController, friend: Friend) {
        self.navigationController = navigationController
        self.friend = friend
    }
    
    func start() {
        let detailVC = FriendDetailViewController.instantiate()
        let viewModel = CEFriendDetailViewModel(friend: friend)
        viewModel.model = CEFriendDetailModel()
        viewModel.coordinatorDelegate = self
        detailVC.viewModel = viewModel
        navigationController.pushViewController(detailVC, animated: false)
    }
}

extension FriendDetailCoordinator: FriendDetailViewModelCoordinatorDelegate {
    func friendDetailDidFinish(viewModel: FriendDetailViewModel) {
        self.delegate?.friendDetailCoordinatorDidFinish(coordinator: self)
    }
}
