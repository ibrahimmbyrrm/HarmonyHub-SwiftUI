//
//  ArtistChartScrollView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI

struct ArtistChartGridView: View {
    
    var tracks : [TracksDatum]?
    
    var columns = [GridItem(.flexible()),
                   GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, content: {
            ForEach(tracks ?? [TracksDatum](),id: \.id) { track in
                NavigationLink {
                    TrackDetailView(selectedTrackID: track.id)
                } label: {
                    TrackCardView(selectedTrack: track)
                }

                
            }
        })
        .padding(.horizontal,5)
    }
}

