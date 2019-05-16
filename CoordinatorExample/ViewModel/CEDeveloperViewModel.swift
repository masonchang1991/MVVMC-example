//
//  CEDeveloperViewModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

class CEDeveloperViewModel: DeveloperViewModel {
    
    var model: DeveloperModel?
    weak var viewDelegate: DeveloperViewModelViewDelegate?
    weak var coordinatorDelegate: DeveloperViewModelCoordinatorDelegate?
    
    var tapTimes: Int = 0 {
        didSet {
            if oldValue != tapTimes {
                model?.adjustColor(tapTimes: tapTimes, completionHandler: { [weak self](color) in
                    guard let self = self else { return }
                    DispatchQueue.main.async {
                        if color != .white {
                            self.viewDelegate?.colorDidChange(viewModel: self, buttonColor: color)
                        } else {
                            self.coordinatorDelegate?.functionOne(viewModel: self)
                        }
                    }
                })
            }
        }
    }
}
