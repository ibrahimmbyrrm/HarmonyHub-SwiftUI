//
//  ArtistsAlbumCard.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

struct ArtistsAlbumCard: View {
    
    var album : BaseAlbum
    
    var body: some View {
        VStack {
            MCImage(urlString: album.coverMedium)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(width: 120, height: 120)
            Text(album.title)
                .font(.custom("ariel", size: 12))
                .lineLimit(0)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: 110)
        
    }
}


