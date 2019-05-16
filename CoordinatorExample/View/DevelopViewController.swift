//
//  FirstViewController.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import UIKit

class DevelopViewController: UIViewController, Storyboarded {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonView: UIView!

    var viewModel: DeveloperViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
        }
    }
    
    private let originColor = UIColor.gray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupActions()
    }
    
    private func setupViews() {
        title = "Developer mode"
        titleLabel.text = "Developer \(navigationController!.viewControllers.count)"
        buttonView.backgroundColor = originColor
    }
    
    private func setupActions() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        buttonView.isUserInteractionEnabled = true
        buttonView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tap() {
        viewModel?.tapTimes += 1
    }
    
    private func refreshViews() {
        buttonView.backgroundColor = originColor
    }
}

extension DevelopViewController: DeveloperViewModelViewDelegate {
    func colorDidChange(viewModel: DeveloperViewModel, buttonColor: UIColor) {
        buttonView.backgroundColor = buttonColor
    }
}
