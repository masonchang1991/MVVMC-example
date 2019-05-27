//
//  FriendListCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

class FriendListCoordinator: BaseCoordinator {

    private let coordinatorFactory: CoordinatorFactory
    private let factory: FriendListModuleFactory
    private let router: Router
    
    init(router: Router, factory: FriendListModuleFactory, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        let viewModel = CEFriendListViewModel()
        viewModel.coordinatorDelegate = self
        viewModel.model = CEFriendListModel()
        let friendListVC = factory.makeFriendListVC(binding: viewModel)
        router.push(friendListVC)
    }
}
extension FriendListCoordinator: FriendListViewModelCoordinatorDelegate {
    
    func goToFriendDetail(_ friend: Friend) {
        let (friendDetailCoordinator, module, rootVC) = coordinatorFactory.makeFriendDetailCoordinatorBox(with: friend)
        friendDetailCoordinator.finishFlow = { [weak self, weak friendDetailCoordinator] in
            guard let self = self,
                let coordinator = friendDetailCoordinator else { return }
            self.router.dismissModule()
            self.removeDependency(coordinator)
        }
        addDependency(friendDetailCoordinator)
        router.present(module)
        friendDetailCoordinator.start()
    }
}
