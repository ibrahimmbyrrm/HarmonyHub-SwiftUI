//
//  PlayPreviewButton.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 24.09.2023.
//

import SwiftUI

struct PlayButton: View {
    var track: TracksDatum
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
            Image(systemName: tracksManager.isTrackPlaying(track) ? "pause.fill" : "play.fill")
                .foregroundStyle(.indigo)
                .padding(7)
                .background(Color.black.opacity(0.8))
                .clipShape(Circle())
        })
        .padding()
    }
}
