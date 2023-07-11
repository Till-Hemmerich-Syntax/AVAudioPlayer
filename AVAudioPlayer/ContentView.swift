//
//  ContentView.swift
//  AVAudioPlayer
//
//  Created by Till Hemmerich on 11.07.23.
//

import SwiftUI
import AVKit


struct ContentView: View {
    @ObservedObject var audioPlayer = AudioPlayer()
    
    var body: some View {
        VStack {
            Text("Music")
                .font(.title)
            Text("Sänger")
                .font(.subheadline)
            
            ProgressView(value: audioPlayer.currentTime,total: (audioPlayer.player.currentItem?.duration.seconds)!)
            HStack{
                Text("\(audioPlayer.currentTime)")
                    .font(.footnote)
                Text("\(audioPlayer.totaltime)")
                    .font(.footnote)
                
            }
            HStack{
                Image(systemName: "arrow.backward.circle")
                    .font(.system(size: 30))
                    .padding()
                    .onTapGesture {
                        audioPlayer.prev()
                    }
                Button(action: {
                    audioPlayer.togglePlay()
                }) {
                    if audioPlayer.isPlaying {
                        Image(systemName: "pause.circle.fill")
                            .font(.system(size: 80))
                            .padding()
                    } else {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 80))
                            .padding()
                    }
                }
               
                Image(systemName: "arrow.forward.circle")
                    .font(.system(size: 30))
                    .padding()
                    .onTapGesture {
                        audioPlayer.next()
                    }
            }
            
            
            Slider(value: $audioPlayer.volume)
            
            
            
            
            
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
