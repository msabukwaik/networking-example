//
//  PhotoControllerScenseUITests.swift
//  iosnetworkingexampleUITests
//
//  Created by Mohammed S A Kwaik on 10/4/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import XCTest

class PhotoControllerScenseUITests: XCTestCase {
    
    var app:XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        
        app = XCUIApplication()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPhotoControlerSenseContent() {
        //Check that the get image view screen has 2 elements, image and button
        //Go to photo controller sense
        app.buttons["Show Random Image"].firstMatch.tap()
        
        //Check the content of photo controller sense content
        XCTAssertTrue(app.buttons["Get new image"].exists)
        XCTAssertTrue(app.staticTexts["Flicker example"].exists)
        XCTAssertTrue(app.images["flickerImage"].exists)
    }
    
    func testShowFlickerImageActicity() {
        //In this activity we are going to check if the
        //flicker image is loaded successfully or not
        XCTContext.runActivity(named: "View random image acticvity") { _ in
            //Go to the photo controler sense
            app.buttons["Show Random Image"].firstMatch.tap()
            
            //Request the image
            app.buttons["Get new image"].firstMatch.tap()
            
            //wait for 10 seconds
            sleep(10)
            
            //Check if the image has been loaded
            XCTAssertTrue(app.images["valedFlickerImage"].exists)
        }
    }

    
}
