//
//  ViewController.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/14/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flickerExampleLbl: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var getImageBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK : Action
    
    @IBAction func getNewImage(_ sender: Any) {
        getImageFromFlicker();
    }
    
    //MARK : Network requests
    
    
    func getImageFromFlicker(){
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
            if error == nil {
                var outputDic:[String:AnyObject]?
                if let data = data{
                    
                    do{
                        outputDic = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject]
                        
                        //Short code
                        if let results = outputDic, let photosDict = (results["photos"] as? [String:AnyObject]), let photoDict:[[String:AnyObject]] = photosDict["photo"] as? [[String:AnyObject]]{
                            let photoIndex = Int(arc4random_uniform(UInt32(photoDict.count)))
                            let photo = photoDict[photoIndex]
                            print(photo["url_m"] as! String)
                            print(photo["title"] as! String)
                            
                            //Create image from url
                            let imageUrl = URL(string: photo["url_m"] as! String)
                            if let imageData = try? Data(contentsOf: imageUrl!), let image = UIImage(data: imageData){
                                DispatchQueue.main.async {
                                    self.photoImageView.image = image
                                    self.enableUI(true)
                                }
                            }
                        }
                        
                        
                        
                    }catch{
                        print("Data could not be parsed")
                    }
                }
            }
        }
        
        task.resume()
        
        //Update the UI
        self.enableUI(false)
    }
    
    func enableUI(_ Enabled:Bool) {
        getImageBtn.isEnabled = Enabled
        
        if getImageBtn.isEnabled{
            getImageBtn.alpha = 1.0
        }else{
            getImageBtn.alpha = 0.5
        }
    }
    
    func escapeParamters(parms:[String:String]) -> String? {
        // check if paramters is not empty
        if parms.isEmpty {
            return nil
        }
        
        var temp:String = ""
        var results:[String] = []
        //Then iterate over it
        for (key, value) in parms {
            //And convert the value of each item in the dictonary to be string
            //Escape tempthe value
            temp = "\(key)=\(value)"
            temp = temp.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""

            
            //Concatenate it with key
            //Concatenate the key-value to the returned string
            results.append(temp)
        }
        
        //Spilit each key-value by &
        //Return the result
        return "?\(results.joined(separator: "&"))"
    }
}

