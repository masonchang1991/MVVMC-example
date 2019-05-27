//
//  Router.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/22.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

protocol Router: Presentable {
    
    //MARK: - why add so many function because protocol function can't add default value to parameters
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, hideBottomBar: Bool)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, completion: (() -> ())?)
    func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> ())?)
    
    func popModule()
    func popModule(animated: Bool)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> ())?)
    
    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
    
    func popToRootModule(animated: Bool)
}
