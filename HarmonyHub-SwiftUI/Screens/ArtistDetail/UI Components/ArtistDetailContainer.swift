//
//  ArtistDetailContainer.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

struct ArtistDetailContainer: View {
    
    var artistDetails : ArtistDetail?
    var trackCount : Int
    
    var body: some View {
        HStack(spacing : 20) {
            MCImage(urlString: artistDetails?.picture_big ?? "")
                .clipShape(Circle())
                .frame(width: 150, height: 150)
            ArtistStats(artist: artistDetails, trackCount: trackCount)
            Spacer()
        }
        .padding(.horizontal)
    }
}

