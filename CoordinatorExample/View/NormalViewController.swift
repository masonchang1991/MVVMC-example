//
//  SecondViewController.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import UIKit

class NormalViewController: UIViewController, Storyboarded {

    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel: NormalViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchName()
    }
}

extension NormalViewController: NormalViewModelViewDelegate {
    func nameDidChange(viewModel: NormalViewModel, name: String) {
        nameLabel.text = name
    }
}
