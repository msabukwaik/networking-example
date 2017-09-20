//
//  IntExtensions.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

extension Int{
    static func random(withLength:Int? = 10, nullable:Bool? = false) -> Int {
        var result:Int = 0
        
        for x in 0..<withLength!{
            result = result * x + Int(arc4random_uniform(UInt32(9)))
        }
        
        return result
    }
}
