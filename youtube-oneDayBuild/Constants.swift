//
//  Constants.swift
//  youtube-oneDayBuild
//
//  Created by mac on 30/11/20.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyDl2XBg0SzAMD319wfWeRY7PpWiCR0Eou8"
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
