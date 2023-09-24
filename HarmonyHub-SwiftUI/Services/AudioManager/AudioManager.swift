//
//  AudioManager.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 24.09.2023.
//

import SwiftUI
import AVFAudio
import AVFoundation

class SoundManager : ObservableObject {
    
    static let shared = SoundManager()
    
    private init() {}
    
    var audioPlayer: AVPlayer?

    func playSound(sound: String){
        if let url = URL(string: sound) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}
