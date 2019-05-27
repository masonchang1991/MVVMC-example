//
//  CENormalViewModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

class CENormalViewModel: NormalViewModel {
    
    var model: NormalModel?
    
    weak var viewDelegate: NormalViewModelViewDelegate?
    
    weak var coordinatorDelegate: NormalViewModelCoordinatorDelegate?
    
    var name: String = "" {
        didSet {
            if oldValue != name {
                // delegate to view
                DispatchQueue.main.async {
                    self.viewDelegate?.nameDidChange(viewModel: self, name: self.name)
                }
            }
        }
    }
    
    func fetchName() {
        model?.getName(completion: { (name) in
            self.name = name
        })
    }
}
