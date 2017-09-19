//
//  FlickerController.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/18/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit


extension UIStoryboard{
    static let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
}

extension ViewController{
    func getImageFromFlicker(completion: @escaping (_ image:UIImage?,_ errorMessage:NetworkError? )->()) {
        //Get the image
        //Prepare URL
        let getPhotoParmeters:[String:String] = [
            "method" : "flickr.galleries.getPhotos",
            "api_key" : "09c7c7493e1fc88a6cf99f8ab98bc158",
            "gallery_id" : "5704-72157622566655097",
            "format" : "json",
            "nojsoncallback" : "1",
            "extras" : "url_m"
        ]
        
        let urlString = Constaints.Flicker.APIBaseClass + (escapeParamters(parms: getPhotoParmeters) ?? "")
        let url = URL(string: urlString)
        let request:URLRequest = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                if error == nil {
                    
                    //data is required
                    guard let data = data else {
                        completion(nil, NetworkError(withDescription: "Data is missed"))
                        return
                    }
                    
                    //Convert the bytes to an object "Dictonary"
                    guard let outputDic = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject] else {
                        completion(nil, NetworkError(withDescription: "Unable to convert data to object"))
                        return
                    }
                    
                    //Get photos dictionary from the results
                    guard let photosDict = (outputDic["photos"] as? [String:AnyObject]) else {
                        completion(nil, NetworkError(withDescription: "Unable to fetch phtots dictionary from the response"))
                        return
                    }
                    
                    guard let photoDict:[[String:AnyObject]] = photosDict["photo"] as? [[String:AnyObject]] else {
                        completion(nil, NetworkError(withDescription: "Unable to fetch photo dictionary from the response"))
                        return
                    }
                    
                    let photoIndex = Int(arc4random_uniform(UInt32(photoDict.count)))
                    let photo = photoDict[photoIndex]
                    
                    //Create image from url
                    let imageUrl = URL(string: photo["url_m"] as! String)
                    
                    guard let imageData = try? Data(contentsOf: imageUrl!) else {
                        completion(nil, NetworkError(withDescription: "Unable to convert the image to data"))
                        return
                    }
                    
                    guard let image = UIImage(data: imageData) else {
                        completion(nil, NetworkError(withDescription: "Unable to convert image data to uiimage"))
                        return
                    }
                    
                    //return the image as UIImage with no errors
                    completion(image, nil)
                    return
                }
            }catch{
                completion(nil, NetworkError(withDescription: "Unable to parse data"))
                return
            }
            
        }
        task.resume()
    }
}

class NetworkError: Error {
    var description:String?
    init(withDescription desc:String?) {
        self.description = desc
    }
}
