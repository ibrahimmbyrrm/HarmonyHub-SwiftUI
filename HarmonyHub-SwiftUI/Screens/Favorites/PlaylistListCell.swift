//
//  PlaylistListCell.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 25.09.2023.
//

import SwiftUI

struct PlaylistListCell: View {
    
    var playlist : DetailedPlaylist
    
    var body: some View {
        HStack {
            MCImage(urlString: playlist.pictureBig)
                .frame(width: 50,height: 50)
            Text(playlist.title)
                .font(.custom("ariel", size: 18))
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
}

