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
    let seederDataSource:Bool = false //Determine the data source the seeded the views
    
    
    
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
        if seederDataSource{
            DispatchQueue.main.async {
                self.photoImageView.image = PhotoCommon.seed().image
                self.enableUI(true)
            }
        }else{
            FlickerControler.getImageFromFlicker { (photo, error) in
                DispatchQueue.main.async {
                    if error == nil {
                        print(photo?.desc() ?? "")
                        self.photoImageView.image = photo?.image
                        self.enableUI(true)
                    }else{
                        print("Error: \(error!)")
                    }
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
}

