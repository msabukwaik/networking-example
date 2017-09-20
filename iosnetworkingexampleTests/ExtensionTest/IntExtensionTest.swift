//
//  IntExtensionTest.swift
//  iosnetworkingexampleTests
//
//  Created by Mohammed S A Kwaik on 9/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import XCTest
@testable import iosnetworkingexample

class IntExtensionTest: XCTestCase {
    
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
        let int1 = Int.random(withLength: 6, nullable: false)
        let int2 = Int.random(withLength: 8, nullable: true)
        let int3 = Int.random()
        
        print("Debug : \(int1) - \(int2) - \(int3)")
        
        if int1 > 99999 && int1 < 9999999{
            XCTAssert(false)
        }
        
        if int2 > 9999999 && int2 < 999999999 {
            XCTAssert(false)
        }
        
        if int3 > 999999999 && int3 < 99999999999{
            XCTAssert(false)
        }
        
        XCTAssert(true)
    }
    
}
