//
//  YoutubeVideoPlayer.swift
//  YoutubeApp
//
//  Created by Fidan Oruc on 05.12.22.
//

import SwiftUI
import WebKit

struct YoutubeVideoPlayer: UIViewRepresentable {
    
    var video: Video
    
    func makeUIView(context: Context) -> some UIView {
        
        // 1. Create the web view
        let view = WKWebView()
        
        // Set the background color for the view
        view.backgroundColor = UIColor(backgroundColor)
        
        // 2. Create the url for the view
        let embedUrlString = Constants.YT_EMBED_URL + video.videoId
        
        // 3. Load the video into the web view
        let url = URL(string: embedUrlString)
        
        let request = URLRequest(url: url!)
        view.load(request)
        
        // 4. Return the web view
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct YoutubeVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeVideoPlayer(video: Video())
    }
}
