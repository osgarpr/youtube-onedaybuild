//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Osvaldo Garcia on 8/23/20.
//  Copyright © 2020 Osvaldo Garcia. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = "UUQ7QfNCfxCmCUs1WBFgpFPA"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
    static var YT_EMBEDED_URL = "https://www.youtube.com/embed/"
}

