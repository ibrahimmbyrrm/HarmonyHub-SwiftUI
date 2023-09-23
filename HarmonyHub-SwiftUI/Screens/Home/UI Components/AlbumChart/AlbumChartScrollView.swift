//
//  AlbumChartScrollView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI

struct AlbumChartScrollView: View {
    
    var albums : [AlbumsDatum]?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(albums ?? [AlbumsDatum](),id: \.id) { album in
                    NavigationLink {
                        AlbumDetailView(selectedalbumId: album.id)
                    } label: {
                        AlbumCardView(album: album)
                            .padding(.horizontal,5)
                    }
                    .scrollTransition { content, phase in
                        content
                            .scaleEffect(phase.isIdentity ? 1 : 0.9)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.init(top: 5, leading: 5, bottom: 0, trailing: 5))
    }
}

