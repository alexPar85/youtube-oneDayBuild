//
//  Model.swift
//  youtube-oneDayBuild
//
//  Created by mac on 30/11/20.
//

import Foundation

class Model{
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        // Get a URL session object
        
        let session = URLSession.shared
        
        // Get a data tast ffrom the URL data object
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //Check if there were any errors
            
            if error != nil || data == nil {
                return
            }
            do{
                let decoder = JSONDecoder()
                
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self ,from: data!)
                
                dump(response)
           
            }
            catch{
                
            }
            // Parsing the data into video objects
             }
        
        // Kick off the tast
        dataTask.resume()
        
    }
    
}
