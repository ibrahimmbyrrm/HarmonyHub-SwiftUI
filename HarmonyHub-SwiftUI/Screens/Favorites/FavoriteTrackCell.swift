//
//  FavoriteTrackCell.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 26.09.2023.
//

import SwiftUI

struct FavoriteTrackCell: View {
    
    var track : TrackDetail
    
    var body: some View {
        HStack {
            MCImage(urlString: track.album.coverBig ?? "")
                .frame(width: 50,height: 50)
            VStack(alignment : .leading) {
                Text(track.title)
                    .font(.custom("ariel", size: 18))
                    .multilineTextAlignment(.leading)
                Text(track.artist.name)
                    .font(.custom("ariel", size: 18))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.leading)

            }
            
        }
        
    }
}

