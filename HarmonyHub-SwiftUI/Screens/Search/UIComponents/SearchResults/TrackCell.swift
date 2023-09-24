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
            PlayButton(track: self.track, soundManager: SoundManager.shared, tracksManager: TracksManager.shared)
        }
        .frame(height: 80)
        .background(Color.white)
    }
}
