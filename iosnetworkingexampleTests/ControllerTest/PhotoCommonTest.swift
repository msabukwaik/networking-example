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
        var isPassed:Bool = true
        let photo1 = PhotoCommon(id: "id", image: UIImage(contentsOfFile: "image"), title: "title", owner: "owner", secret: "secret", server: 1, farm: 2, ispublic: 3, isfriend: true, isfamily: false, url_m: "url_m", height_m: 4, width_m: 5, is_primary: 6, has_comment: 7)
        let photo2 = PhotoCommon(id: "id", image: UIImage(contentsOfFile: "image"), title: "title")
        let photo3 = PhotoCommon(id: nil, image: nil, title: nil)
        let photo4 = PhotoCommon(id: nil, image: nil, title: nil, owner: nil, secret: nil, server: nil, farm: nil, ispublic: nil, isfriend: nil, isfamily: nil, url_m: nil, height_m: nil, width_m: nil, is_primary: nil, has_comment: nil)
        
        if !(photo1.id == "id" && photo1.image == UIImage(contentsOfFile: "image") && photo1.title == "title" && photo1.owner == "owner" && photo1.secret == "secret" && photo1.server == 1 && photo1.farm == 2 && photo1.ispublic == 3 && photo1.isfriend == true && photo1.isfamily == false && photo1.url_m == "url_m" && photo1.height_m == 4 && photo1.width_m == 5 && photo1.is_primary == 6 && photo1.has_comment == 7){
            isPassed = false
        }
        
        if !(photo2.id == "id" && photo2.image == UIImage(contentsOfFile: "image") && photo2.title == "title"){
            isPassed = false
        }
        
        if !(photo3.id == nil && photo3.image == nil && photo3.title == nil){
            isPassed = false
        }
        
        if !(photo4.id == nil && photo4.image == nil && photo4.title == nil && photo4.owner == nil && photo4.secret == nil && photo4.server == nil && photo4.farm == nil && photo4.ispublic == nil && photo4.isfriend == nil && photo4.isfamily == nil && photo4.url_m == nil && photo4.height_m == nil && photo4.width_m == nil && photo4.is_primary == nil && photo4.has_comment == nil){
            isPassed = false
        }
        
        XCTAssert(isPassed)
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
