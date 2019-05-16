//
//  DeveloperModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

protocol DeveloperModel {
    func adjustColor(tapTimes: Int, completionHandler: @escaping ((UIColor) -> ()))
}
