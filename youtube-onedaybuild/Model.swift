//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Osvaldo Garcia on 8/23/20.
//  Copyright © 2020 Osvaldo Garcia. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos:[Video])
}

class Model {
    
    var delegate:ModelDelegate?
    
    func getVideos() {
        
        //Create a URL obj
        let url = URL(string: Constants.API_URL)
        guard url != nil else {
            return
        
        }
        
        //Create a URLSession obj
        let session = URLSession.shared
        
        //Get a data task from the URL session obj
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //Check if is any error
            if error != nil || data == nil {
                return
            }
            do {
                //Parsing data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        //Call the "videosFetched" method of the delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                    
                    
                
                
                }
                dump(response)
            }
            catch {
                
                
            }
            
        }
            //Kick of the task
            dataTask.resume()
        
    }
    
}
