//
//  ViewController.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/14/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

class PhotoController: UIViewController {

    @IBOutlet weak var flickerExampleLbl: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var getImageBtn: UIButton!
    let loadDataSource:DataSourceLayer  = .coreDataLayer
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Used by the ui test in order to check if the view has an image or not
        photoImageView.accessibilityIdentifier = "flickerImage"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK : Action
    @IBAction func getNewImage(_ sender: Any) {
        
        //Disable Get New Image button till this photo is fetched
        self.enableUI(false)
        
        switch loadDataSource {
        case .coreDataLayer:
            if PhotoCommon.getContextPhotos().count >= 1{
                DispatchQueue.main.async {
                    self.photoImageView.image = PhotoCommon.getContextPhotos()[Int(arc4random_uniform(UInt32(PhotoCommon.getContextPhotos().count)))].image
                    self.enableUI(true)
                }
            }
        case .cashedLayer:
            if PhotoCommon.cashedPhotos.count >= 1{
                DispatchQueue.main.async {
                    self.photoImageView.image = PhotoCommon.cashedPhotos[0].image
                    self.enableUI(true)
                }
            }
        case .seedLayer:
            DispatchQueue.main.async {
                self.photoImageView.image = PhotoCommon.seed().image
                self.enableUI(true)
            }
        case .networkLayer:
            FlickerControler.getImageFromFlicker { (photo, error) in
                if error == nil {
                    DispatchQueue.main.async {
                        self.photoImageView.image = photo?.image
                        self.enableUI(true)
                    }
                    
                    if let _ = photo?.image{

                        //Set identifier to be used by the ui unit tests
                        //in order to test that the image has been loaded
                        self.photoImageView.accessibilityIdentifier = "valedFlickerImage"
                    }
                    photo?.saveToContext(completion: { (success, message) in})
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

// Enum used for the type of the datasource used to feed the views
enum DataSourceLayer:String {
    case coreDataLayer
    case cashedLayer
    case seedLayer
    case networkLayer
}

