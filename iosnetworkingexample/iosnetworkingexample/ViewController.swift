//
//  ViewController.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/14/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

extension UIApplication{
    var statusBarView:UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

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
        
        //Update the UI
        self.enableUI(false)
        
        getImageFromFlicker { (image, error) in
            DispatchQueue.main.async {
                if error == nil {
                    self.photoImageView.image = image
                    self.enableUI(true)
                }else{
                    print("Error: \(error!)")
                }
            }
        }
    }
    
    //MARK : Network requests
    
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

