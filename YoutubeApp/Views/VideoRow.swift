//
//  VideoRow.swift
//  YoutubeApp
//
//  Created by Fidan Oruc on 05.12.22.
//

import SwiftUI

struct VideoRow: View {
    
    @ObservedObject var videoPreview: VideoPreview
    
    @State private var isPresenting = false
    @State private var imageHeight: CGFloat = 0
    
    var body: some View {
        Button {
            // Present the detail sheet
            isPresenting = true
        } label: {
            
            VStack(alignment: .leading, spacing: 10){
                
                // Display the thumbnail image
                GeometryReader{ geo in
                    
                     // Create an image from the videopreview's data
                    Image(uiImage: UIImage(data: videoPreview.thumbnailData) ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.width * 9 / 16) // Set the aspect ratio of the frame to be 9/16
                        .clipped()
                        .onAppear {
                            // Update the height of the image
                            imageHeight = geo.size.width * 9 / 16
                        }
                }
                .frame(height: imageHeight) // We set the height explicitly so the geometry reader's proposed height is not collapsed
            
                
                // Display the video's title
                Text(videoPreview.title).bold()
                
                // Display the video's date
                Text(videoPreview.date)
                    .foregroundColor(.gray)
                
                
            }
            .font(.system(size: 20))
        }.sheet(isPresented: $isPresenting) {
            // Display the detail view for the video
            VideoDetail(video: videoPreview.video)
        }
        
    }
}

struct VideoRow_Previews: PreviewProvider {
    static var previews: some View {
        VideoRow(videoPreview: VideoPreview(video: Video()))
    }
}
