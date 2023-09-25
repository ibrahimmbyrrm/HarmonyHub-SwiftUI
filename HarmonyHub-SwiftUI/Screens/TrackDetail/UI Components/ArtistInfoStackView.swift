//
//  ArtistInfoStackView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 25.09.2023.
//

import SwiftUI

struct ArtistInfoStackView : View {
    
    var artist : GeneralArtist?
    
    var body: some View {
        NavigationLink {
            ArtistDetailView(selectedArtistId: artist?.id ?? 1)
        } label: {
            HStack {
                MCImage(urlString: artist?.pictureMedium ?? "")
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                Text(artist?.name ?? "")
                    .foregroundStyle(Color.label)
                Spacer()
            }
            .padding()
        }

        
    }
}
