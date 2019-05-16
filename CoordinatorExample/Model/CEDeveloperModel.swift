//
//  CEDeveloperModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/16.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation
import UIKit

class CEDeveloperModel: DeveloperModel {
    
    func adjustColor(tapTimes: Int, completionHandler: @escaping ((UIColor) -> ())) {
        DispatchQueue.global().async {
            if tapTimes < 15 {
                completionHandler(UIColor(red: (CGFloat(tapTimes + 1)/15),
                                          green: (CGFloat(tapTimes + 1)/15),
                                          blue: (CGFloat(tapTimes + 1)/15),
                                          alpha: 1.0))
            } else {
                completionHandler(UIColor.white)
            }
        }
    }
}
