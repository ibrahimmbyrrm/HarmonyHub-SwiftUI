//
//  PlaylistCardView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI
import Kingfisher

struct PlaylistCardView: View {

    var playlist : PlaylistsDatum
    
    var body: some View {
        MCImage(urlString: playlist.pictureBig)
            .frame(width: 180, height: 180)
    }
}

