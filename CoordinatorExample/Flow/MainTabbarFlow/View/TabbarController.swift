//
//  MainTabbarController.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController, TabbarView, Storyboarded {
    
    var tabbarItemSelectAt: ((UINavigationController, Int) -> ())?
    var onViewDidLoad: ((UITabBarController) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        onViewDidLoad?(self)
    }
}

extension TabbarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let navController = viewControllers?[selectedIndex] as? UINavigationController else { return }
        tabbarItemSelectAt?(navController, selectedIndex)
    }
}
