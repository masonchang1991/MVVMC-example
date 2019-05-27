//
//  Presentable.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/22.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    func toPresent() -> UIViewController? {
        return self
    }
}
