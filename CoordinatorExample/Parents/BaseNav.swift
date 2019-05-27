//
//  BaseNav.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/27.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

class BaseNav: UINavigationController {
    
    
    deinit {
        print(classForCoder.self, "dealloc")
    }
}
