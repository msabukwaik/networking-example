//
//  FlickerControler.swift
//  iosnetworkingexampleTests
//
//  Created by Mohammed S A Kwaik on 9/18/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import XCTest
@testable import iosnetworkingexample

class FlickerControlerTest: XCTestCase {
    
    var vc:ViewController!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //Ref to the storyboard
        let storybarod = UIStoryboard(name: "Main", bundle: Bundle.main)
        //Ref to the viewcontroller of the storyboard
        vc = storybarod.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        //_ = UIStoryboard.storyboardShared.instantiateViewController(withIdentifier: "ViewController")
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
    
    //Test the getImageFromFlicker method, it should return the image fetched from flicker as UIImage
    //Note : This is async testing using completion clourse
    func testGetImageFromFlicker() {
        let expection = expectation(description: "Waiting for timeout reaching")
        
        FlickerControler.getImageFromFlicker{ (photo, error) in
            if error != nil {
                print("Error : \(error?.description ?? "")")
                XCTAssert(false)
            }else if photo != nil{
                //print(photo?.desc() ?? "")
                expection.fulfill()
            }
        }
        
        //Timeout for the request is 10 seconds
        self.waitForExpectations(timeout: 10) { (error) in
            print("Error : \(error.debugDescription)")
        }
    }
}
