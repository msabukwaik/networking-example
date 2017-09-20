//
//  UIApplicationExtensions.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

extension UIApplication{
    var statusBarView:UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
