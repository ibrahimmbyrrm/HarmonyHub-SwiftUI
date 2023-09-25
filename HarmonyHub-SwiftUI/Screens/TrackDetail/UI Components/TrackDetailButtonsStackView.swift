//
//  TrackDetailButtonsStackView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 25.09.2023.
//

import SwiftUI

struct TrackDetailButtonsStackView: View {
    
    var track : TrackDetail?
    @Binding var isFavorite : Bool
    
    var body: some View {
        VStack(alignment : .trailing) {
            Button(action: {
                if isFavorite {
                    FavoritesManager.shared.removeFromFavorites(.track(track?.id ?? 0), sender: .HeartButton)
                } else {
                    FavoritesManager.shared.addToFavorites(.track(track?.id ?? 0))
                }
                isFavorite.toggle()
            }, label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .font(.system(size: 30))
            })
            .padding(.trailing)
            if let track = track {
                PlayButton(track: track, size: 25, soundManager: SoundManager.shared, tracksManager: TracksManager.shared)
            }
        }
    }
}
