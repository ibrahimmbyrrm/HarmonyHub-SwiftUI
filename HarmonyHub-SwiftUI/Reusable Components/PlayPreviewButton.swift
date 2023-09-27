//
//  PlayPreviewButton.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 24.09.2023.
//

import SwiftUI

struct PlayButton: View {
    var track: PreviewPlayable
    var size : CGFloat
    @StateObject var soundManager: SoundManager
    @ObservedObject var tracksManager: TracksManager
    
    var body: some View {
        Button(action: {
            withAnimation {
                if tracksManager.isTrackPlaying(track) {
                    soundManager.audioPlayer?.pause()
                } else {
                    soundManager.playSound(sound: track.preview)
                    soundManager.audioPlayer?.play()
                }
                tracksManager.playTrack(track)
            }
        }, label: {
            Image(systemName: tracksManager.isTrackPlaying(track) ? SFSymbols.pause : SFSymbols.play)
                .font(.system(size: size))
                .foregroundStyle(.indigo)
                .padding(7)
                .background(Color.gray.opacity(0.5))
                .clipShape(Circle())
                
        })
        .padding()
    }
}
