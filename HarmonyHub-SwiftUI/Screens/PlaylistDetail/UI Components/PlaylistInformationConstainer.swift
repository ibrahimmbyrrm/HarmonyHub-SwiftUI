//
//  PlaylistInformationConstainer.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

struct PlaylistInformationContainer: View {
    
    @Binding var playlist: DetailedPlaylist?
    @Binding var isFavorite : Bool 

    var body: some View {
        VStack {
            HStack {
                Text(playlist?.title ?? "")
                    .font(.custom(Fonts.ariel, size: 24))
                Spacer()
                Button(action: {
                    if isFavorite {
                        FavoritesManager.shared.removeFromFavorites(.playlist(playlist?.id ?? 0), sender: .HeartButton)
                    } else {
                        FavoritesManager.shared.addToFavorites(.playlist(playlist?.id ?? 0))
                    }
                    isFavorite.toggle()
                }, label: {
                    Image(systemName: isFavorite ? SFSymbols.filledHeart : SFSymbols.heart)
                })
            }
            .padding(.horizontal)
            
            HStack {
                Text(playlist?.description ?? "")
                    .foregroundStyle(Color(uiColor: .lightGray))
                    .font(.custom(Fonts.ariel, size: 16))
                Spacer()
            }
            .padding(.top, 5)
            .padding(.horizontal)
        }

    }
}
