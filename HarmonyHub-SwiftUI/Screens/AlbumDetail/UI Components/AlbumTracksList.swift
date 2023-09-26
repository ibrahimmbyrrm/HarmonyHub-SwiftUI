//
//  AlbumTracksList.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

struct AlbumTracksList: View {
    
    var tracks : [TracksDatum]?
    
    var body: some View {
        VStack {
            ForEach(tracks ?? [TracksDatum](),id: \.id) { track in
                NavigationLink {
                    TrackDetailView(selectedTrackID: track.id)
                } label: {
                    TrackCell(track: track)
                }
            }
        }
    }
}

#Preview {
    AlbumTracksList()
}
