//
//  iosnetworkingexampleUITests.swift
//  iosnetworkingexampleUITests
//
//  Created by Mohammed S A Kwaik on 9/14/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import XCTest

class iosnetworkingexampleUITests: XCTestCase {
    
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
    
    func testatherScreenshots(){
        XCTContext.runActivity(named: "capture screenshots") { activity in
            
            //Main screen
            let mainScreen = XCUIScreen.main
            var fullScreenShot = mainScreen.screenshot()
            var fullScreenShotAttachment = XCTAttachment(screenshot: fullScreenShot)
            fullScreenShotAttachment.lifetime = .keepAlways
            activity.add(fullScreenShotAttachment)
            
            app.buttons["Show Random Image"].firstMatch.tap()
            fullScreenShot = mainScreen.screenshot()
            fullScreenShotAttachment = XCTAttachment(screenshot: fullScreenShot)
            fullScreenShotAttachment.lifetime = .keepAlways
            activity.add(fullScreenShotAttachment)
            
            app.buttons["Get new image"].firstMatch.tap()
            sleep(10)
            fullScreenShot = mainScreen.screenshot()
            fullScreenShotAttachment = XCTAttachment(screenshot: fullScreenShot)
            fullScreenShotAttachment.lifetime = .keepAlways
            activity.add(fullScreenShotAttachment)
        }
    }
    
}
