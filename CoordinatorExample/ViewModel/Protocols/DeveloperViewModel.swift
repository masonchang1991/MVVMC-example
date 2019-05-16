//
//  DeveloperViewModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

protocol DeveloperViewModelViewDelegate: class {
    func colorDidChange(viewModel: DeveloperViewModel, buttonColor: UIColor)
}

protocol DeveloperViewModelCoordinatorDelegate: class {
    func functionOne(viewModel: DeveloperViewModel)
}

protocol DeveloperViewModel {
    
    var model: DeveloperModel? { get set }
    var viewDelegate: DeveloperViewModelViewDelegate? { get set }
    var coordinatorDelegate: DeveloperViewModelCoordinatorDelegate? { get set }
    
    var tapTimes: Int { get set }
}
