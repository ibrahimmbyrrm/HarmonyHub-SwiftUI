//
//  AlbumCardView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI
import Kingfisher

struct AlbumCardView : View {
    
    var album : AlbumsDatum
    
    var body: some View {
        VStack(alignment : .leading) {
            MCImage(urlString: album.coverBig)
                .frame(width: 150,height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Group {
                Text(album.title)
                    .foregroundStyle(Color.label)
                Text(album.artist?.name ?? "")
                    .foregroundStyle(Color.init(uiColor: UIColor.lightGray))
            }
            .padding(.leading,3)
        }
        
    }
}

