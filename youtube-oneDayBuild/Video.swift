//
//  Video.swift
//  youtube-oneDayBuild
//
//  Created by mac on 30/11/20.
//

import Foundation

struct Video : Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    
    enum CodingKeys : String, CodingKey {
        
        // Keys to reach subkeys
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case videoId     // same key name in json
        case title       // same key name in json
        case description // same key name in json
        case thumbnail = "url"
        case published = "publishedAt"
    }
    
    init(from decoder: Decoder) throws {
        
        // Pass "items" conteiner to container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Pass "snippet" container to snippetContainer
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
       // print ("title////////////////////////////////////////////////")
        //print (title)
        
        // Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        //print("description////////////////////////////////////////////////")
        //print (description)
        // Parse the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        //print("published////////////////////////////////////////////////")
        //print (published)
        // Parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        //print("thumbnail////////////////////////////////////////////////")
        //print (thumbnail)
        // Parse videoId
        let resourceIdContainder = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainder.decode(String.self, forKey: .videoId)
        //print("videoId////////////////////////////////////////////////")
        //print (videoId)
        
    }
}
