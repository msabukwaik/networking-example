//
//  UIImageExtensions.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

extension UIImage{
    static func random(nullable:Bool? = false) -> UIImage?{
        if nullable == true{
            if (Int(arc4random_uniform(UInt32(10))) % 2 == 0)
            {
                return UIImage(named: "example")
            }
            
            return nil
        }
        return UIImage(named: "example")
    }
}
