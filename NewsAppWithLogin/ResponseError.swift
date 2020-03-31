//
//  ResponseError.swift
//  NewsDemoApp
//
//  Created by RakeSanzzy Shrestha on 3/29/20.
//  Copyright © 2020 SelfProject. All rights reserved.
//

import Foundation

struct ResponseError: Error{
    var title: String
    var code: Int
    var errorDescription: String? { return _description}
    var failureReason: String? {return _description}
    
    private var _description: String
    
    init(description: String, code: Int) {
        self.title = "Error"
        self._description = description
        self.code = code
    }
    
    init(title: String, description: String, code: Int) {
        self.title = title
        self._description = description
        self.code = code
    }
}
