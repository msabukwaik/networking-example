//
//  UtilityTest.swift
//  iosnetworkingexampleTests
//
//  Created by Mohammed S A Kwaik on 9/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import XCTest
@testable import iosnetworkingexample

class UtilityTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testEscapeParamters() {
        let getPhotoParmeters:[String:String] = [
            "method" : "flickr.galleries.getPhotos",
            "api_key" : "09c7c7493e1fc88a6cf99f8ab98bc158",
            "gallery_id" : "5704-72157622566655097",
            "format" : "json",
            "nojsoncallback" : "1",
            "extras" : "url_m"
        ]
        
        let urlString = escapeParamters(parms: getPhotoParmeters)
        XCTAssertNotNil(urlString)
        XCTAssertFalse(urlString!.contains(" "))
    }
    
}
