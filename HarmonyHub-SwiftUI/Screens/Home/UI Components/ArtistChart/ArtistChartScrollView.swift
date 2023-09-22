//
//  ArtistChartScrollView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI

struct ArtistChartScrollView: View {
    
     var artists : [ArtistElement]?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(artists ?? [ArtistElement](),id: \.id) { artist in
                    ArtistCardView(artist: artist)
                        .padding(.horizontal,5)
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal,5)
    }
}