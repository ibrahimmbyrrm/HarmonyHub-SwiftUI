//
//  ArtistsAlbumsScrollView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

struct ArtistsAlbumsScrollView: View {
    
    var albums : [BaseAlbum]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack() {
                ForEach(albums,id: \.id) { album in
                    NavigationLink {
                        AlbumDetailView(selectedalbumId: album.id)
                    } label: {
                        ArtistsAlbumCard(album: album)
                            .padding(.horizontal,5)
                    }
                    .scrollTransition { content, phase in
                        content
                            .scaleEffect(phase.isIdentity ? 1 : 0.75)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal,5)
    }
}

