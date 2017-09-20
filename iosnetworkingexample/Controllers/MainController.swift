//
//  MainViewController.swift
//  iosnetworkingexample
//
//  Created by Mohammed S A Kwaik on 9/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showRandomImageBtn(_ sender: Any) {
        performSegue(withIdentifier: "GoToPhotoSegue", sender: self)
    }
}
