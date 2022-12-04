//
//  CacheManager.swift
//  YoutubeApp
//
//  Created by Fidan Oruc on 04.12.22.
//

import Foundation

class CacheManager{
     
    static var cache = [String : Data]()
    
    static func setVideoCache(url: String, data: Data?){
        
        // Store the image data with the url as the key
        cache[url] = data
    }
    
    static func getVideoCache(url: String) -> Data?{
        
        // Try and get the data for the specified URL
        return cache[url]
    }
}
