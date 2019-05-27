//
//  FriendDetailViewController.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController, Storyboarded {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var friendStatusView: UIView!
    
    var viewModel: FriendDetailViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
            // RefreshView
            if oldValue != nil {
                refreshDisplay()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupActions()
        viewModel?.getCurrentFavoriteState()
    }

    private func refreshDisplay() {
        nameLabel.text = viewModel?.friend.name
        viewModel?.getCurrentFavoriteState()
    }
    
    private func setupViews() {
        let backButton = UIBarButtonItem(image: UIImage(named: "back"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(pop))
        self.navigationItem.setLeftBarButton(backButton, animated: false)
        
        nameLabel.text = viewModel?.friend.name
        friendStatusView.backgroundColor = (viewModel?.isFavorite ?? false) ? UIColor.red: UIColor.blue
    }
    
    private func setupActions() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFavoriteStateView))
        friendStatusView.isUserInteractionEnabled = true
        friendStatusView.addGestureRecognizer(tap)
    }
    
    @objc private func tapFavoriteStateView() {
       viewModel?.changeState()
    }
    
    @objc private func pop() {
        viewModel?.detailDidFinish()
    }
}

extension FriendDetailViewController: FriendDetailViewModelViewDelegate {
    
    func friendDetailDidFriendDataChange(viewModel: FriendDetailViewModel, friend: Friend) {
        nameLabel.text = friend.name
    }
    
    func friendDetailFavoriteStateDidChange(viewModel: FriendDetailViewModel, isFavorite: Bool) {
        friendStatusView.backgroundColor = isFavorite ? UIColor.red: UIColor.blue
    }
}
