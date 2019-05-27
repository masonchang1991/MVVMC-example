//
//  AuthModuleFactory.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/23.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

protocol AuthModuleFactory {
    func makeLoginVC(binding viewModel: LoginAndRegisterViewModel) -> Presentable
    func makeRegisterVC(binding viewModel: LoginAndRegisterViewModel) -> Presentable
    
}
