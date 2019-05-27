//
//  TabbarView.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/23.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

protocol TabbarView: class {
    var tabbarItemSelectAt: ((UINavigationController, Int) -> ())? { get set }
    var onViewDidLoad: ((UITabBarController) -> ())? { get set }
}
