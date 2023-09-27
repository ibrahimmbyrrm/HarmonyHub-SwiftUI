//
//  AlbumNameAndOwnerStack.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

struct AlbumNameAndOwnerStack: View {
    
    var album : BaseAlbum?
    @Binding var isFavorite : Bool
    
    var body: some View {
        HStack {
            VStack(alignment : .leading) {
                Group {
                    Text(album?.title ?? "")
                        .foregroundStyle(Color(uiColor: .label))
                    Text(album?.artist?.name ?? "")
                        .foregroundStyle(Color(uiColor: .darkGray))
                }
                .font(.custom(Fonts.ariel, size: 20))
                
            }
            Spacer()
            Button(action: {
                if isFavorite {
                    FavoritesManager.shared.removeFromFavorites(.album(album?.id ?? 0), sender: .HeartButton)
                } else {
                    FavoritesManager.shared.addToFavorites(.album(album?.id ?? 0))
                }
                isFavorite.toggle()
            }, label: {
                Image(systemName: isFavorite ? SFSymbols.filledHeart : SFSymbols.heart)
            })
        }
        .padding(.horizontal,10)
    }
}

