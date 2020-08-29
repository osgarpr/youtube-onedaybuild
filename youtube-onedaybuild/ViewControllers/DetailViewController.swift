//
//  DetailViewController.swift
//  youtube-onedaybuild
//
//  Created by Osvaldo Garcia on 8/28/20.
//  Copyright © 2020 Osvaldo Garcia. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var webView: WKWebView!
    
    
    @IBOutlet weak var textView: UITextView!
    
    
    var video:Video?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       
        //Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        
        //Check if ther is a video
        guard video != nil else {
            return
        }
        
        //Create the embeded URL
        let embedURLString = Constants.YT_EMBEDED_URL + video!.videoId
        
        //Load it into the webview
        let url = URL(string: embedURLString)
        let request = URLRequest(url:url!)
        webView.load(request)
        
        //Set the title
        titleLabel.text = video!.title
        
        //Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        //Set the description
        textView.text = video!.description
        
        
    }
   
}
    
    
    
