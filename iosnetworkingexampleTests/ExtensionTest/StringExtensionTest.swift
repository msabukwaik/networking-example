//
//  StringExtensionTest.swift
//  iosnetworkingexampleTests
//
//  Created by Mohammed S A Kwaik on 9/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import XCTest
@testable import iosnetworkingexample

class StringExtensionTest: XCTestCase {
    
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
    
    func testRandom(){
        let str1 = String.random(withLength: 6, nullable: false)
        let str2 = String.random(withLength: 8, nullable: true)
        let str3 = String.random()
        
        print("Debug : \(str1) - \(str2) - \(str3)")
        
        if str1.count != 6{
            XCTAssert(false)
        }
        
        if str2.count != 8{
            XCTAssert(false)
        }
        
        if str3.count != 10{
            XCTAssert(false)
        }
        
        XCTAssert(true)
    }
    
}
