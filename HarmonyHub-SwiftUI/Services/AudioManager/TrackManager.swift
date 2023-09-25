//
//  TrackManager.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 24.09.2023.
//

import SwiftUI

protocol PreviewPlayable {
    var id : Int {get set}
    var preview : String {get set}
}

class TracksManager: ObservableObject {
    static let shared = TracksManager()
    
    @Published var currentlyPlayingTrack: PreviewPlayable?
    
    private init() {}
    
    func playTrack(_ track: PreviewPlayable) {
        if currentlyPlayingTrack?.id == track.id {
            currentlyPlayingTrack = nil
        } else {
            currentlyPlayingTrack = track
        }
    }
    
    func isTrackPlaying(_ track: PreviewPlayable) -> Bool {
        return currentlyPlayingTrack?.id == track.id
    }
}
