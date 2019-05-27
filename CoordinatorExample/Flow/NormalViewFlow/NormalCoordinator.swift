//
//  NormalCoordinator.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit


protocol NormalCoordinatorOutput: class {
    var finishFlow: (() -> ())? { get set }
}

class NormalCoordinator: BaseCoordinator, NormalCoordinatorOutput {
    
    private let factory: NormalModuleFactory
    private let router: Router
    
    var finishFlow: (() -> ())?
    
    init(with factory: NormalModuleFactory, router: Router) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        let viewModel = CENormalViewModel()
        viewModel.coordinatorDelegate = self
        viewModel.model = CENormalModel()
        let normalVC = factory.makeNormalVC(binding: viewModel)
        self.router.setRootModule(normalVC)
    }
}

extension NormalCoordinator: NormalViewModelCoordinatorDelegate {
    func none() {
        
    }
}
