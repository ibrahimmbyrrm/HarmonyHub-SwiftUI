//
//  TrackTitlesStackView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 25.09.2023.
//

import SwiftUI

struct TrackTitlesStackView : View {
    
    var track : TrackDetail?
    @Binding var isFavorite : Bool
    
    var body: some View {
        HStack {
            VStack(alignment : .leading,spacing: 5) {
                Text(track?.title ?? "")
                    .font(.custom(Fonts.ariel, size: 24))
                    .foregroundStyle(Color.label)
                Text(track?.artist.name ?? "")
                    .font(.custom(Fonts.ariel, size: 20))
                    .foregroundStyle(Color.label)
                Text(track?.typeAndDate ?? "")
                    .font(.custom(Fonts.ariel, size: 16))
                    .foregroundStyle(.gray)
            }
            .padding()
            Spacer()
            TrackDetailButtonsStackView(track: self.track, isFavorite: $isFavorite)    
        }
    }
}
