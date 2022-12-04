//
//  VideoModel.swift
//  YoutubeApp
//
//  Created by Fidan Oruc on 04.12.22.
//

import Foundation
import Alamofire

class VideoModel: ObservableObject{
    
    @Published var videos = [Video]()
    
    init(){
        
        getVideos()
    }
    
    func getVideos(){
        
        // Create a URL object
        guard let url = URL(string: "\(Constants.API_URL)/playlistItems") else{
            return
        }
        
        
        // Get a decoder
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        // Create a URL request
        AF.request( // other attrs have default values
            url,
            parameters: ["part": "snippet",
                         "playlistId": Constants.PLAYLIST_ID,
                         "key": Constants.API_KEY]
        )
        .validate() // checks if http response is 200 it gives us success otherwise fail
        .responseDecodable(of: Response.self, decoder: decoder){ response in
            
            // Check that the call was succesful
            switch response.result{
            case .success:
                break
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
            
            // Update the UI with the videos
            if let items = response.value?.items{
                
                DispatchQueue.main.async {
                    self.videos = items
                }
            }
            
        }
        
        
    }
}
// ObservableObject -- we can update the user interface whenever changes are made and  the way  to do that by  having published variables and whenever that variable is updated  any views rely on that property will be update
