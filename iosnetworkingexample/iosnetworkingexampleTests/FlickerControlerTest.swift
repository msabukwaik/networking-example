//
//  FlickerControler.swift
//  iosnetworkingexampleTests
//
//  Created by Mohammed S A Kwaik on 9/18/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import XCTest
@testable import iosnetworkingexample

class FlickerControler: XCTestCase {
    
    var vc:ViewController!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //Ref to the storyboard
        let storybarod = UIStoryboard(name: "Main", bundle: Bundle.main)
        //Ref to the viewcontroller of the storyboard
        vc = storybarod.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        vc = nil
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }
    
    func testGetImageFromFlicker() {
        let expection = expectation(description: "Waiting for testing")
        var img:UIImage?
        
        vc.getImageFromFlicker { (image, error) in
            if error == nil && image != nil{
                expection.fulfill()
                img = image
            }
        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            if error == nil{
                XCTAssert(img != nil)
            }else{
                print(error.debugDescription)
            }
            
        }
    }
}
