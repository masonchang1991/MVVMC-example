//
//  CENormalModel.swift
//  CoordinatorExample
//
//  Created by Mason on 2019/5/17.
//  Copyright © 2019 MS. All rights reserved.
//

import Foundation

class CENormalModel: NormalModel {
    
    func getName(completion: @escaping ((String) -> ())) {
        DispatchQueue.global().async {
            completion("Mason")
        }
    }
}
