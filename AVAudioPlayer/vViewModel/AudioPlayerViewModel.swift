//
//  AudioPlayerViewModel.swift
//  AVAudioPlayer
//
//  Created by Till Hemmerich on 11.07.23.
//

import Foundation
import AVKit
class AudioPlayer : ObservableObject{
    @Published var player = AVPlayer()
    @Published var currentTime = 0.0
    @Published var totaltime = 0.0
    @Published var isPlaying = false
    @Published var currentIndex = 0
    @Published var songList = [String]()
    
    @Published var volume : Float = 0.3{
        didSet{
            print(volume)
            player.volume = self.volume
        }
    }
    
    var url1 = "https://media.blubrry.com/muslim_central_quran/podcasts.qurancentral.com/aaar-al-hudhoudi/001.mp3"
    var url2 = "https://cdn.islamic.network/quran/audio/128/ar.alafasy/9.mp3"
    var url3 = "https://cdn.islamic.network/quran/audio/128/ar.alafasy/10.mp3"
  
    
    
    init(){
        songList.append(url1)
        songList.append(url2)
        songList.append(url3)
        setupPlayer(url : songList[0])
    }
    
    func togglePlay(){
        if(isPlaying){
            player.pause()
        }else{
            player.play()
        }
        isPlaying.toggle()
    }
    func setupPlayer(url :  String){
        player = AVPlayer(url: URL(string: url)!)
        player.volume = Float(volume)
        addTimeObserver()
    }

    func next(){
        if(currentIndex < songList.count-1){
            setupPlayer(url: songList[currentIndex+1])
            currentIndex += 1
            player.play()
            print("next")
        }
    }
    func prev(){
        if(currentIndex > 0){
            setupPlayer(url: songList[currentIndex-1])
            currentIndex -= 1
            player.play()
            print("prev")
        }
    }
    
    
    func addTimeObserver(){
        player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.1, preferredTimescale: 500), queue: nil) { time in
            print(time.seconds)
            self.currentTime = time.seconds
        }
    }
}

