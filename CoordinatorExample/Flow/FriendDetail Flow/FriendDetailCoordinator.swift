//
//  FriendDetailCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

protocol FriendDetailCoordinatorOutput: class {
    var finishFlow: (() -> ())? { get set }
}

class FriendDetailCoordinator: BaseCoordinator, FriendDetailCoordinatorOutput {
    
    private let factory: FriendDetailModuleFactory
    private let router: Router
    
    var finishFlow: (() -> ())?
    
    var friend: Friend
    
    init(with factory: FriendDetailModuleFactory, router: Router, friend: Friend) {
        self.factory = factory
        self.router = router
        self.friend = friend
    }
    
    override func start() {
        let viewModel = CEFriendDetailViewModel(friend: friend)
        viewModel.model = CEFriendDetailModel()
        viewModel.coordinatorDelegate = self
        let friendDetailVC = factory.makeFriendDetailVC(binding: viewModel)
        router.setRootModule(friendDetailVC)
    }
}

extension FriendDetailCoordinator: FriendDetailViewModelCoordinatorDelegate {
    func friendDetailDidFinish(viewModel: FriendDetailViewModel) {
        self.finishFlow?()
    }
}
