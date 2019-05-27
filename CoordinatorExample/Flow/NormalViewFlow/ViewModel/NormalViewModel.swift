//
//  NormalViewModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

protocol NormalViewModelViewDelegate: class {
    func nameDidChange(viewModel: NormalViewModel, name: String)
}

protocol NormalViewModelCoordinatorDelegate: class {
    func none()
}

protocol NormalViewModel {
    
    var model: NormalModel? { get set }
    var viewDelegate: NormalViewModelViewDelegate? { get set }
    var coordinatorDelegate: NormalViewModelCoordinatorDelegate? { get set }
    
    var name: String { get set }
    
    func fetchName()
}
