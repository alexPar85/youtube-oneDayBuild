//
//  Model.swift
//  youtube-oneDayBuild
//
//  Created by mac on 30/11/20.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos : [Video])
    
}

class Model{
    
    var delegate : ModelDelegate?
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
           // print ("URL = nil//////////////////////////////////////////////////////////")
            return
        }
        // Get a URL session object
        
        let session = URLSession.shared
        
        // Get a data tast ffrom the URL data object
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //Check if there were any errors
            
            if error != nil || data == nil {
                print ("in if error//////////////////////////////////////////////////////////")
                print(error!)
                return
            }
            do{
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self ,from: data!)
                
                if response.items != nil {
                    DispatchQueue.main.async {
                        // Call the "videoFetched" method of the delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                }
                //dump(response)
           
            }
            catch{
                
            }
            
             }
        
        // Kick off the tast
        dataTask.resume()
        
    }
    
}
