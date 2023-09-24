//
//  TrackManager.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 24.09.2023.
//

import SwiftUI

class TracksManager: ObservableObject {
    static let shared = TracksManager()
    
    @Published var currentlyPlayingTrack: TracksDatum?
    
    private init() {}
    
    func playTrack(_ track: TracksDatum) {
        if currentlyPlayingTrack == track {
            currentlyPlayingTrack = nil
        } else {
            currentlyPlayingTrack = track
        }
    }
    
    func isTrackPlaying(_ track: TracksDatum) -> Bool {
        return currentlyPlayingTrack == track
    }
}
