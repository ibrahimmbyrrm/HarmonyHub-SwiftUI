//
//  TrackCardView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI

struct TrackCardView: View {
    
    var selectedTrack : TracksDatum?
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: selectedTrack?.album.coverBig ?? "")) { image in
                image
                    .resizable()
                    .frame(width: 180, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } placeholder: {
                Image(systemName: "music.mis")
                    .resizable()
                    .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            }
            Text(selectedTrack?.title ?? "")
            Text(selectedTrack?.artist?.name ?? "")
                .foregroundStyle(Color(uiColor: .lightGray))
                .padding(.leading,3)
            
        }
    }
}

