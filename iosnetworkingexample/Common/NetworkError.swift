//
//  NetworkError.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

struct NetworkError: Error {
    var description:String?
    init(withDescription desc:String?) {
        self.description = desc
    }
}
