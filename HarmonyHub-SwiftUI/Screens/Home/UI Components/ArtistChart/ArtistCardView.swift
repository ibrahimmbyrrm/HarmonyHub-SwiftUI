//
//  ArtistCardView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI
import Kingfisher

struct ArtistCardView : View {
    
    var artist : ArtistElement
    
    var body: some View {
        VStack {
            MCImage(urlString: artist.pictureMedium ?? "")
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            Text(artist.name)
                .foregroundStyle(Color.label)
        }
        
    }
}
