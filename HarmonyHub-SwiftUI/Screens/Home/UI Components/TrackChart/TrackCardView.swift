//
//  TrackCardView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI
import Kingfisher

struct TrackCardView: View {
    
    var selectedTrack : TracksDatum?
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                MCImage(urlString: selectedTrack?.album.coverBig ?? "")
                    .frame(width: 180, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text(selectedTrack?.title ?? "")
                Text(selectedTrack?.artist?.name ?? "")
                    .foregroundStyle(Color(uiColor: .lightGray))
                    .padding(.leading,3)
            }
            PlayButton(track: self.selectedTrack!, soundManager: SoundManager.shared, tracksManager: TracksManager.shared)
                .offset(x: -65.0, y: 40.0)
                
        }
    
        
    }
}


