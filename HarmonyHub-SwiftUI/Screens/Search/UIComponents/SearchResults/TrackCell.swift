//
//  TrackCell.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI
import Kingfisher
import AVFAudio
import AVFoundation

struct TrackCell: View {
    var track: TracksDatum
    @StateObject private var soundManager = SoundManager.shared
    @ObservedObject private var tracksManager = TracksManager.shared

    var body: some View {
        HStack {
            MCImage(urlString: track.album.coverBig)
                .frame(width: 76, height: 76)
                .padding(.horizontal, 5)
            VStack(alignment: .leading, spacing: 8) {
                Text(track.title)
                    .font(.custom("ariel", size: 18))
                    .foregroundStyle(.black)
                Text(track.artist?.name ?? "")
                    .font(.custom("ariel", size: 16))
                    .foregroundStyle(Color(uiColor: .lightGray))
            }
            Spacer()
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
            })
            .padding()
        }
        .frame(height: 80)
        .background(Color.white)
    }
}

