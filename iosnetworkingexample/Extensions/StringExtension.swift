//
//  StringExtensions.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

extension String{
    static func random(withLength:Int? = 10, nullable:Bool? = false) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var result:String = ""
        
        for _ in 0..<withLength!{
            result.append(base[base.index(base.startIndex, offsetBy: Int(arc4random_uniform(UInt32(base.characters.count))))])
        }
        
        return result
    }
}
