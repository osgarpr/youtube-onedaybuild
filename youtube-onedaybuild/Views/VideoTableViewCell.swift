//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Osvaldo Garcia on 8/24/20.
//  Copyright © 2020 Osvaldo Garcia. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setCell(_ v:Video){
        
        self.video = v
        
        //Ensure that we have a video
        guard self.video != nil else {
            return
        }
        
        //set title label
        self.titleLabel.text = video?.title
        
        //set date label
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        //set thumbnail
        guard self.video!.thumbnail != "" else {
            return
            
        }
        
        //Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            //Set the thumbnail image
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        //Download the tumbnail
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL session object
        let session = URLSession.shared
        
        //Create a dataTask
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                //Save the data in cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                //Check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.video?.thumbnail {
                    return
                }
                
                //Create the image object
                let image = UIImage(data: data!)
                
                //Set the image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }
            
        }
        //Start dataTask
        dataTask.resume()
    }

}
