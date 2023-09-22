//
//  ArtistCardView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI

struct ArtistCardView : View {
    
    var artist : ArtistElement
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: artist.pictureXl!), content: { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
            }, placeholder: {
                Image(systemName: "person.circle")
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
            })
            
            .clipShape(Circle())
            Text(artist.name)
                .foregroundStyle(.black)
        }
        
    }
}
