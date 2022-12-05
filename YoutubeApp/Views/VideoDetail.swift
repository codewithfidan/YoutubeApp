//
//  VideoDetail.swift
//  YoutubeApp
//
//  Created by Fidan Oruc on 05.12.22.
//

import SwiftUI

struct VideoDetail: View {
    
    var video: Video
    
    var date:  String{
        // Create a formatted date from the video's date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: video.published)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            
            // Display the video's title
            Text(video.title)
                .bold()
            
            // Display the date
            Text(date)
                .foregroundColor(.gray)
            
            // Display the video
            YoutubeVideoPlayer(video: video)
                .aspectRatio(CGSize(width: 1280, height: 700), contentMode: .fit)
            
            // Display the description
            ScrollView{
                Text(video.description)
            }
            
        }
        .font(.system(size: 20))
        .padding()
        .padding(.top, 50)
        .background(backgroundColor.ignoresSafeArea(.all))
    }
}

struct VideoDetail_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetail(video: Video())
    }
}
