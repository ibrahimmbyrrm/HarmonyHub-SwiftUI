//
//  TracksListOfPlaylist.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

struct TracksListOfPlaylist: View {
    
    var trackList : [TracksDatum]
    
    var body: some View {
        VStack {
            ForEach(trackList,id:\.id) { track in
                NavigationLink {
                    TrackDetailView(selectedTrackID: track.id)
                } label: {
                    TrackCell(track: track)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0)
                                .scaleEffect(phase.isIdentity ? 1 : 0.75)
                                .blur(radius: phase.isIdentity ? 0 : 1)
                        }
                }

                
                
            }
        }
    }
}

