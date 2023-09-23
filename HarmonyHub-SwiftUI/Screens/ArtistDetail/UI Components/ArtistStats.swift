//
//  ArtistStats.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

struct ArtistStats : View {
    
    var artist : ArtistDetail?
    var trackCount : Int?
    
    var body: some View {
        VStack(alignment : .leading,spacing: 10) {
            Text(artist?.name ?? "")
                .font(.custom("ariel", size: 32))
            Group {
                Text("\(artist?.popularity ?? "")")
                Text("\(artist?.nb_album ?? 0) Albums")
                Text("\(trackCount ?? 0) Tracks")
            }
            .font(.custom("ariel", size: 20))
            .foregroundStyle(Color(uiColor: .darkGray))
            Spacer()

        }
    }
}
