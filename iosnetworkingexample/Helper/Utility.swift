//
//  Utility.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

func escapeParamters(parms:[String:String]) -> String? {
    // check if paramters is not empty
    if parms.isEmpty {
        return nil
    }
    
    var temp:String = ""
    var results:[String] = []
    //Then iterate over it
    for (key, value) in parms {
        //And convert the value of each item in the dictonary to be string
        //Escape tempthe value
        temp = "\(key)=\(value)"
        temp = temp.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        
        
        //Concatenate it with key
        //Concatenate the key-value to the returned string
        results.append(temp)
    }
    
    //Spilit each key-value by &
    //Return the result
    return "?\(results.joined(separator: "&"))"
}
