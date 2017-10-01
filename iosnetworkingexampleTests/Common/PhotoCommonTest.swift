//
//  PhotoCommonTest.swift
//  iosnetworkingexampleTests
//
//  Created by Mohammed S A Kwaik on 9/20/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import XCTest
@testable import iosnetworkingexample

class PhotoCommonTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("setup")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //Constructor unit test
    func testInit() {
        let photo1 = PhotoCommon(id: "id", image: UIImage(contentsOfFile: "image"), title: "title", owner: "owner", secret: "secret", server: 1, farm: 2, ispublic: 3, isfriend: true, isfamily: false, url_m: "url_m", height_m: 4, width_m: 5, is_primary: 6, has_comment: 7)
        let photo2 = PhotoCommon(id: "id", image: UIImage(contentsOfFile: "image"), title: "title")
        let photo3 = PhotoCommon(id: nil, image: nil, title: nil)
        let photo4 = PhotoCommon(id: nil, image: nil, title: nil, owner: nil, secret: nil, server: nil, farm: nil, ispublic: nil, isfriend: nil, isfamily: nil, url_m: nil, height_m: nil, width_m: nil, is_primary: nil, has_comment: nil)

        XCTAssertEqual(photo1.id, "id")
        XCTAssertEqual(photo1.image, UIImage(contentsOfFile: "image"))
        XCTAssertEqual(photo1.title, "title")
        XCTAssertEqual(photo1.owner, "owner")
        XCTAssertEqual(photo1.secret, "secret")
        XCTAssertEqual(photo1.server, 1)
        XCTAssertEqual(photo1.farm, 2)
        XCTAssertEqual(photo1.ispublic, 3)
        XCTAssertEqual(photo1.isfriend, true)
        XCTAssertEqual(photo1.isfamily, false)
        XCTAssertEqual(photo1.url_m, "url_m")
        XCTAssertEqual(photo1.height_m, 4)
        XCTAssertEqual(photo1.width_m, 5)
        XCTAssertEqual(photo1.is_primary, 6)
        XCTAssertEqual(photo1.has_comment, 7)
        

        XCTAssertEqual(photo2.id, "id")
        XCTAssertEqual(photo2.image, UIImage(contentsOfFile: "image"))
        XCTAssertEqual(photo2.title, "title")
        

        XCTAssertNil(photo3.id)
        XCTAssertNil(photo3.image)
        XCTAssertNil(photo3.title)
        
        
        XCTAssertNil(photo4.id)
        XCTAssertNil(photo4.image)
        XCTAssertNil(photo4.title)
        XCTAssertNil(photo4.owner)
        XCTAssertNil(photo4.secret)
        XCTAssertNil(photo4.server)
        XCTAssertNil(photo4.farm)
        XCTAssertNil(photo4.ispublic)
        XCTAssertNil(photo4.isfriend)
        XCTAssertNil(photo4.isfamily)
        XCTAssertNil(photo4.url_m)
        XCTAssertNil(photo4.height_m)
        XCTAssertNil(photo4.width_m)
        XCTAssertNil(photo4.is_primary)
        XCTAssertNil(photo4.has_comment)
    }
    
    //Test seeder with single value
    func testGetCommonPhoto(){
        let res:PhotoCommon = PhotoCommon.seed()
        print(res.desc() ?? "Error: no data contained")
        XCTAssert(res.isfamily == true || res.isfamily == false)
    }
    
    //Test seeder with multipe value
    func testGetCommonPhotos(){
        let res = PhotoCommon.seed(withLength: 10)
        XCTAssert(res.count == 10 && (res[0].isfamily == true || res[0].isfamily == false) && (res[9].isfamily == true || res[9].isfamily == false))
    }
    
}
