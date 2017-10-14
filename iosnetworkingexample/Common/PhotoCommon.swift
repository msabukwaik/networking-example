//
//  PhotoCommon.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/20/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit
import CoreData


/// This is a struct used for presenting flicker photo
public struct PhotoCommon {
    
    // MARK: Attributes
    
    /// The id of the filker photo
    public var id:String?
    
    /// The photo of the filker
    public var image:UIImage?
    
    /// The title of the filker photo
    public var title:String?
    
    /// The owner of the filker photo
    public var owner:String?
    
    /// The secret of the filker photo
    public var secret:String?
    
    /// The server of the filker photo
    public var server:Int?
    
    /// The fram of the filker photo
    public var farm:Int?
    
    /// Does this photo is public ?
    public var ispublic:Int?
    
    /// Does this photo is a friend's photo ?
    public var isfriend:Bool?
    
    /// Does this photo is a family's photo ?
    public var isfamily:Bool?
    
    /// The url of the mimized verison of the filker photo, stored as a string
    public var url_m:String?
    
    /// The height of the mimized version of the filker photo
    public var height_m:Int?
    
    /// The width of the minimized verion of the filker photo
    public var width_m:Int?
    
    /// The primary id of the filker photo
    public var is_primary:Int?
    
    /// The number of comments this filker photo has
    public var has_comment:Int?
    
    // MARK: Constructors
    
    
    /**
     Call this constructor for inializating all attributes of this struct
     - Parameters:
     - id : The id of the filker photo
     - image : The photo of the filker
     - title : The title of the filker photo
     - owner : The owner of the filker photo
     - secret : The secret of the filker photo
     - server : The server of the filker photo
     - farm:Int : The fram of the filker photo
     - ispublic: : Does this photo is public ?
     - isfriend : Does this photo is a friend's photo ?
     - isfamily : Does this photo is a family's photo ?
     - url_m : The url of the mimized verison of the filker photo, stored as a string
     - height_m: : The height of the mimized version of the filker photo
     - width_m:Int : The width of the minimized verion of the filker photo
     - is_primary:Int : The primary id of the filker photo
     - has_comment:Int : The number of comments this filker photo has
     
     ### Usage Example: ###
     ````
     let photo1 = PhotoCommon(id: "id", image: UIImage(contentsOfFile: "image"), title: "title", owner: "owner", secret: "secret", server: 1, farm: 2, ispublic: 3, isfriend: true, isfamily: false, url_m: "url_m", height_m: 4, width_m: 5, is_primary: 6, has_comment: 7)
     let photo4 = PhotoCommon(id: nil, image: nil, title: nil, owner: nil, secret: nil, server: nil, farm: nil, ispublic: nil, isfriend: nil, isfamily: nil, url_m: nil, height_m: nil, width_m: nil, is_primary: nil, has_comment: nil)
     ````
     */
    public init(id:String?, image:UIImage?, title:String?, owner:String?, secret:String?, server:Int?, farm:Int?, ispublic:Int?, isfriend:Bool?, isfamily:Bool?, url_m:String?, height_m:Int?, width_m:Int?, is_primary:Int?, has_comment:Int?) {
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
    
    /**
     Call this constructor for inializating id, image and title of this struct
     - Parameters:
     - id : The id of the filker photo
     - image : The photo of the filker
     - title : The title of the filker photo
     
     ### Usage Example: ###
     ````
     let photo2 = PhotoCommon(id: "id", image: UIImage(contentsOfFile: "image"), title: "title")
     let photo3 = PhotoCommon(id: nil, image: nil, title: nil)
     ````
     */
    public init(id:String?, image:UIImage?, title:String?) {
        self.id = id
        self.image = image
        self.title = title
    }
    
    init() {
        
    }
    
    // MARK: Core Data Layer
    
    /**
     Call this function for saving photo in the core data
     - Parameters:
     - Completion clouser : Takes two paramter, the first one is a boolean that shows wether the data has been saved successfully in the core data or not, and another paramter called message which stores the error message in case the operation has been failed
     
     ### Usage Example: ###
     ````
     Obj:Photo = Photo()
     Obj.saveToContext{ (sucess, message) in
     
     }
     ````
     */
    public func saveToContext(completion : (Bool, String?) -> ()){
        //Convert PhotoCommon to PhotoMO
        //Create an object of photo and set its values
        let photo:PhotoMO = PhotoMO(context: CoreDataContext.context)
        photo.id = self.id
        photo.title = self.title
        photo.owner = self.owner
        photo.secret = self.secret
        
        if let imageVal = self.image{
            photo.image = UIImagePNGRepresentation(imageVal) as NSData?
        }
        
        if let server = self.server{
            photo.server = Int64(server)
        }
        
        if let farm = self.farm{
            photo.farm = Int64(farm)
        }
        
        if let ispublic = self.ispublic{
            photo.ispublic = Int64(ispublic)
        }
        
        
        if let isfriend = self.isfriend{
            photo.isfriend = isfriend
        }
        
        
        if let isfamily = self.isfamily{
            photo.isfamily = isfamily
        }
        
        photo.url_m = self.url_m
        
        if let height_m = self.height_m{
            photo.height_m = Int64(height_m)
        }
        
        
        if let width_m = self.width_m{
            photo.width_m = Int64(width_m)
        }
        
        if let is_primary = self.is_primary{
            photo.is_primary = Int64(is_primary)
        }
        
        if let has_comment = self.has_comment{
            photo.has_comment = Int64(has_comment)
        }
        
        //Save the changes
        CoreDataContext.saveContext { (success, message) in
            if (success){
                completion(success, message)
            }
        }
    }
    
    /**
     Call this function for retiving photos stored in core data
     
     ### Usage Example: ###
     ````
     let photos = PhotoCommon.getContextPhotos()
     
     }
     ````
     */
    public static func getContextPhotos() -> [PhotoCommon]{
        // Fetch the photos from the core data
        let photoFetchRequest:NSFetchRequest<PhotoMO> = PhotoMO.fetchRequest()
        var photos:[PhotoMO] = [PhotoMO]()
        do{
            photos = try CoreDataContext.context.fetch(photoFetchRequest)
        }catch{
            
        }
        
        var photoCommons:[PhotoCommon] = [PhotoCommon]()
        var tempPhotoCommon:PhotoCommon
        for photo in photos {
            tempPhotoCommon = PhotoCommon()
            tempPhotoCommon.id = photo.id
            tempPhotoCommon.title = photo.title
            tempPhotoCommon.owner = photo.owner
            tempPhotoCommon.secret = photo.secret
            tempPhotoCommon.isfriend = photo.isfriend
            tempPhotoCommon.isfamily = photo.isfamily
            tempPhotoCommon.url_m = photo.url_m
            
            if let imageData = photo.image{
                tempPhotoCommon.image = UIImage(data: imageData as Data)
            }
            
            if let server = tempPhotoCommon.server{
                tempPhotoCommon.server = Int(server)
            }
            
            if let farm = tempPhotoCommon.farm{
                tempPhotoCommon.farm = Int(farm)
            }
            
            if let ispublic = tempPhotoCommon.ispublic{
                tempPhotoCommon.ispublic = Int(ispublic)
            }
            
            if let height_m = tempPhotoCommon.height_m{
                tempPhotoCommon.height_m = Int(height_m)
            }
            
            if let width_m = tempPhotoCommon.width_m{
                tempPhotoCommon.width_m = Int(width_m)
            }
            
            if let is_primary = tempPhotoCommon.is_primary{
                tempPhotoCommon.is_primary = Int(is_primary)
            }
            
            if let has_comment = tempPhotoCommon.has_comment{
                tempPhotoCommon.has_comment = Int(has_comment)
            }
            photoCommons.append(tempPhotoCommon)
        }
        
        return photoCommons
    }
    
    // MARK: Cashed Layer
    
    /// This variable is used in order to store a collection of photos in memory so that they can be reached easily by the application
    public static var cashedPhotos:[PhotoCommon] = [PhotoCommon]()
    
    /**
     Call this static function for appending photo to cashedPhotos collection
     - Parameters:
     - photo : Takes an object of PhotoCommon struct and appending it to cashedPhotos collection
     
     ### Usage Example: ###
     ````
     Obj:Photo = Photo()
     PhotoCommon.addToCash(Obj)
     ````
     */
    public static func addToCash(photo:PhotoCommon){
        cashedPhotos.append(photo)
    }
    
    /**
     Call this function for appending photo to cashedPhotos collection
     - Parameters:
     - photo : Takes an object of PhotoCommon struct and appending it to cashedPhotos collection
     
     ### Usage Example: ###
     ````
     Obj:Photo = Photo()
     Obj.addToCash()
     ````
     */
    public func addToCash(){
        PhotoCommon.cashedPhotos.append(self)
    }

    /**
     Call this static function for appending a list of photos to cashedPhotos collection
     - Parameters:
     - photo : Takes an object of PhotoCommon struct and appending it to cashedPhotos collection
     
     ### Usage Example: ###
     ````
     Obj:[Photo] = [Photo]()
     PhotoCommon.addToCash(Obj)
     ````
     */
    public static func addToCash(photos:[PhotoCommon]){
        for photo in photos {
            cashedPhotos.append(photo)
        }
    }
    
    // MARK: Seeding Layer
    
    
    /**
     Call this static function for retrieving an object of PhotoCommon struct with random data for its attributes
     
     ### Usage Example: ###
     ````
     Obj:Photo = PhotoCommon.seed()
     ````
     */
    public static func seed() -> PhotoCommon {
        return PhotoCommon(id: String.random(), image: UIImage.random(), title: String.random(), owner: String.random(), secret: String.random(), server: Int.random(), farm: Int.random(), ispublic: Int.random(), isfriend: Bool.random(), isfamily: Bool.random(), url_m: String.random(), height_m: Int.random(), width_m: Int.random(), is_primary: Int.random(), has_comment: Int.random())
    }
    
    /**
     Call this static function for retrieving a collection of PhotoCommon filled by random data for its attributes
     - Parameters:
     - withLength : Determine the size of the returned collection by default its 10
     ### Usage Example: ###
     ````
     Obj:Photo = PhotoCommon.seed(withLength : 10)
     ````
     */
    public static func seed(withLength len:Int? = 10) -> [PhotoCommon]{
        var photos:[PhotoCommon] = []
        for _ in 1...len!{
            photos.append(self.seed())
        }
        return photos
    }
    
    // MARK: General Behaviours
    
    /**
     Call this function to describe the current object
     ### Usage Example: ###
     ````
     Obj:Photo = PhotoCommon.seed()
     print(Obj.desc())
     ````
     */
    public func desc() -> String?{
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


