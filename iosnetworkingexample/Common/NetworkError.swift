//
//  NetworkError.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

/// This is a struct used for presenting errors associated to network requests
public struct NetworkError: Error {
    var description:String?
    init(withDescription desc:String?) {
        self.description = desc
    }
}
