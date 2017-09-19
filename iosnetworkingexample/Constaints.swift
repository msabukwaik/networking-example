//
//  Constaints.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/14/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

class Constaints {
    struct Flicker {
        static let APIBaseClass = "https://api.flickr.com/services/rest/"
    }
    
    struct FlickerParamsKeys {
        static let method = "method"
        static let apiKey = "api_key"
        static let galleryId = "gallery_id"
        static let format = "format"
        static let nojsoncallback = "nojsoncallback"
        static let authToken = "auth_token"
        static let apiSig = "api_sig"
    }
    
    struct FlickerParamsValues {
        static let method = "flickr.galleries.getPhotos"
        static let apiKey = "126f4ea8a26de98d7a3b91fd3644f2bf"
        static let galleryId = "5704-72157622566655097"
        static let format = "json"
        static let nojsoncallback = "1"
        static let authToken = "72157686533233893-41b0a6848263b730"
        static let apiSig = "518c7bde7284596259ad81268e7b70f0"
    }
}
