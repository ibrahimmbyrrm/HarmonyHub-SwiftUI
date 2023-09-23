//
//  PlaylistGridView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

struct PlaylistGridView : View {
    
    @Binding var columns : [GridItem]
    @Binding var playlists : [PlaylistsDatum]
    
    var body: some View {
        LazyVGrid(columns: columns, content: {
            ForEach(playlists,id: \.id) { playlist in
                NavigationLink {
                    PlaylistDetail(selectedPlaylistId: playlist.id)
                } label: {
                    PlaylistCardView(playlist: playlist)
                        .frame(width: 180,height: 180)
                }
            }
        })
    }
}
