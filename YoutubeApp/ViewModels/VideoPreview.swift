//
//  VideoPreview.swift
//  YoutubeApp
//
//  Created by Fidan Oruc on 04.12.22.
//

import Foundation
import Alamofire

class VideoPreview: ObservableObject{
    
    @Published var thumbnailData = Data()
    @Published var title: String
    @Published var date: String
    
    var videos: Video
    
    init(video: Video){
        
        // Set the video and title
        self.videos = video
        self.title = video.title
        
        // Set the date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
         
        self.date =  dateFormatter.string(from: video.published)
        
        
        // Download the image data
        guard video.thumbnail != "" else { return }
        
        // Check the cache before downloading the data
        if let cacheData = CacheManager.getVideoCache(url: video.thumbnail){
            
            // Set the thumbnail data
            thumbnailData = cacheData
            return
        }
        
        // Get a url from the thumbnail
        guard let url = URL(string: video.thumbnail) else { return }
        
        // Create the request
        AF.request(url).validate().responseData { response in
            
            if let data = response.data{
                
                // Save the data in the cache
                CacheManager.setVideoCache(url: video.thumbnail, data: data)
                
                // Set the image
                DispatchQueue.main.async {
                    self.thumbnailData = data 
                }
            }
        }
        
        
    }
    
}
