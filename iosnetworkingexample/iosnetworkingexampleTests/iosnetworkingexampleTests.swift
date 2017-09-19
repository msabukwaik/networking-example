//
//  iosnetworkingexampleTests.swift
//  iosnetworkingexampleTests
//
//  Created by Mohammed S A Kwaik on 9/14/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import XCTest
@testable import iosnetworkingexample

class iosnetworkingexampleTests: XCTestCase {
    
    var viewController:ViewController!
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        viewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        _ = viewController.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        viewController = nil
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
    
    func testSayHello() {
        print("Hello world")
    }
    
    func testGetImageFromFlicker() {
        let expection = expectation(description: "Waiting for testing")
        var img:UIImage?
        
        print(viewController.sayHi())
        viewController.getImageFromFlicker { (image, error) in
            if error == nil && image != nil{
                expection.fulfill()
                img = image
            }
        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            if error == nil{
                print("Image exists")
                XCTAssert(img != nil)
            }else{
                print(error.debugDescription)
            }
            
        }
    }
}
