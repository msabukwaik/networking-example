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
    
    // MARK: Attributes
    
    /// The description of the error as a string
    public var description:String?
    
    // MARK: Constructors
    
    /**
     Call this constructor to inilialize the description attribute
     - Parameters
     - withDescription : the description message of the error
     
     ### Usage Example: ###
     ````
     let ne = NetworkError(withDescription : "Invalid access")
     ````
     
     */
    public init(withDescription desc:String?) {
        self.description = desc
    }
}
