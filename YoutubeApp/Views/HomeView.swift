//
//  HomeView.swift
//  YoutubeApp
//
//  Created by Fidan Oruc on 05.12.22.
//

import SwiftUI


let backgroundColor = Color(red: 31 / 255, green: 33 / 255, blue: 36 / 255)

struct HomeView: View {
    
    @StateObject var model = VideoModel()
    
    var body: some View {
        
        
        
        
        ScrollView{
            LazyVStack{
                ForEach(model.videos, id:\.videoId){video in
                    // Display a row for each video
                    VideoRow(videoPreview: VideoPreview(video: video))
                        .padding()
                }
            }
            .padding(.top, 20)
        }
        .foregroundColor(.white)
        .background(backgroundColor.ignoresSafeArea(.all))
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
//
