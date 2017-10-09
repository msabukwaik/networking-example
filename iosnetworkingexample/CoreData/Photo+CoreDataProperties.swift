//
//  Photo+CoreDataProperties.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 10/9/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var has_comment: Int64
    @NSManaged public var is_primary: Int64
    @NSManaged public var width_m: Int64
    @NSManaged public var height_m: Int64
    @NSManaged public var url_m: String?
    @NSManaged public var isfamily: Bool
    @NSManaged public var isfriend: Bool
    @NSManaged public var ispublic: Int64
    @NSManaged public var farm: Int64
    @NSManaged public var server: Int64
    @NSManaged public var secret: String?
    @NSManaged public var owner: String?
    @NSManaged public var title: String?
    @NSManaged public var image: NSData?
    @NSManaged public var id: Int64

}
