//
//  BoolExtensions.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

extension Bool{
    static func random() -> Bool{
        
        if (Int(arc4random_uniform(UInt32(10))) % 2 == 0)
        {
            return true
        }
        
        return false
    }
}
