//
//  Constants.swift
//  App3
//
//  Created by christopher conyersIV on 12/1/23.
//

import Foundation

struct Constants {
    
    static var API_Key = "AIzaSyAUnURq9dsstmTe6bG9br1P6OVTnFrqa-8"
    static var PLAYLIST_ID = "PLMU76ExVK1XA-H5eSgszmIeaL0MmG1fjt"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_Key)"
}
