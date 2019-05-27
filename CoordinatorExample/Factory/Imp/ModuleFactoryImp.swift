//
//  ModuleFactoryImp.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/23.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

final class ModuleFactoryImp:
    AuthModuleFactory,
    NormalModuleFactory,
    FriendListModuleFactory,
    FriendDetailModuleFactory
{
    
    func makeLoginVC(binding viewModel: LoginAndRegisterViewModel) -> Presentable {
        let loginVC = LoginAndRegisterViewController.instantiate()
        loginVC.viewModel = viewModel
        return loginVC
    }
    
    func makeRegisterVC(binding viewModel: LoginAndRegisterViewModel) -> Presentable {
        let loginVC = LoginAndRegisterViewController.instantiate()
        loginVC.viewModel = viewModel
        return loginVC
    }
    
    func makeNormalVC(binding viewModel: NormalViewModel) -> Presentable {
        let normalVC = NormalViewController.instantiate()
        normalVC.viewModel = viewModel
        return normalVC
    }
    
    func makeFriendListVC(binding viewModel: FriendListViewModel) -> Presentable {
        let friendListVC = FriendListTableViewController.instantiate()
        friendListVC.viewModel = viewModel
        return friendListVC
    }
    
    func makeFriendDetailVC(binding viewModel: FriendDetailViewModel) -> Presentable {
        let friendDetailVC = FriendDetailViewController.instantiate()
        friendDetailVC.viewModel = viewModel
        return friendDetailVC
    }
}

