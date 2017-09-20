//
//  PhotoCommon.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/20/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

struct PhotoCommon {
    var id:String?
    var image:UIImage?
    var title:String?
    var owner:String?
    var secret:String?
    var server:Int?
    var farm:Int?
    var ispublic:Int?
    var isfriend:Bool?
    var isfamily:Bool?
    var url_m:String?
    var height_m:Int?
    var width_m:Int?
    var is_primary:Int?
    var has_comment:Int?
    
    init(id:String?, image:UIImage?, title:String?, owner:String?, secret:String?, server:Int?, farm:Int?, ispublic:Int?, isfriend:Bool?, isfamily:Bool?, url_m:String?, height_m:Int?, width_m:Int?, is_primary:Int?, has_comment:Int?) {
        self.id = id
        self.image = image
        self.title = title
        self.owner = owner
        self.secret = secret
        self.server = server
        self.farm = farm
        self.ispublic = ispublic
        self.isfriend = isfriend
        self.isfamily = isfamily
        self.url_m = url_m
        self.height_m = height_m
        self.width_m = width_m
        self.is_primary = is_primary
        self.has_comment = has_comment
    }
    
    init(id:String?, image:UIImage?, title:String?) {
        self.id = id
        self.image = image
        self.title = title
    }
    
    static func seed() -> PhotoCommon {
        return PhotoCommon(id: String.random(), image: UIImage.random(), title: String.random(), owner: String.random(), secret: String.random(), server: Int.random(), farm: Int.random(), ispublic: Int.random(), isfriend: Bool.random(), isfamily: Bool.random(), url_m: String.random(), height_m: Int.random(), width_m: Int.random(), is_primary: Int.random(), has_comment: Int.random())
    }
    
    static func seed(withLength len:Int? = 10) -> [PhotoCommon]{
        var photos:[PhotoCommon] = []
        for _ in 1...len!{
            photos.append(self.seed())
        }
        return photos
    }
    
    func desc() -> String?{
        var description:String?
        
        if let id = id {
            description = (description ?? "") + "id = " + id + "\n"
        }
        
        if let title = title {
            description = (description ?? "") + "title = " + title + "\n"
        }
        
        if let _ = image {
            description = (description ?? "") + " has an image"  + "\n"
        }
        
        if let owner = owner {
            description = (description ?? "") + "owner = " + owner  + "\n"
        }
        
        if let secret = secret {
            description = (description ?? "") + "secret = " + secret + "\n"
        }
        
        if let server = server {
            description = (description ?? "") + "server = " + String(server) + "\n"
        }
        
        if let farm = farm {
            description = (description ?? "") + "farm = " + String(farm) + "\n"
        }
        
        if let ispublic = ispublic {
            description = (description ?? "") + "ispublic = " + String(ispublic) + "\n"
        }
        
        if let isfriend = isfriend {
            description = (description ?? "") + "isfriend = " + String(isfriend) + "\n"
        }
        
        if let isfamily = isfamily {
            description = (description ?? "") + "isfamily = " + String(isfamily) + "\n"
        }
        
        if let url_m = url_m {
            description = (description ?? "") + "url_m = " + String(url_m) + "\n"
        }
        
        if let height_m = height_m {
            description = (description ?? "") + "height_m = " + String(height_m) + "\n"
        }
        
        if let width_m = width_m {
            description = (description ?? "") + "width_m = " + String(width_m) + "\n"
        }
        
        if let is_primary = is_primary {
            description = (description ?? "") + "is_primary = " + String(is_primary) + "\n"
        }
        
        if let has_comment = has_comment {
            description = (description ?? "") + "has_comment = " + String(has_comment) + "\n"
        }
        
        return description
    }
}


