//
//  PlaylistInformationConstainer.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

struct PlaylistInformationConstainer: View {

    var playlist : DetailedPlaylist?

    
    var body: some View {
        VStack {
            HStack {
                Text(playlist?.title ?? "")
                    .font(.custom("ariel", size: 24))
                Spacer()
                Image(systemName: "heart")

            }
            .padding(.horizontal)
            HStack{
                Text(playlist?.description ?? "")
                    .foregroundStyle(Color(uiColor: .lightGray))
                    .font(.custom("ariel", size: 16))
                Spacer()
            }
            .padding(.top,5)
            .padding(.horizontal)
        }
    }
        
}

#Preview {
    PlaylistInformationConstainer()
}
