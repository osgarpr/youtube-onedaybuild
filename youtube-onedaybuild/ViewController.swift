//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Osvaldo Garcia on 8/23/20.
//  Copyright © 2020 Osvaldo Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
        
    }
        


}
