//
//  ArtistDetailView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI
import Kingfisher

struct ArtistDetailView: View {
    
    
    var selectedArtistId : Int
    @StateObject private var viewModel = ArtistDetailViewModel(service: NetworkManager())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ArtistDetailContainer(artistDetails: viewModel.artistDetails, trackCount: viewModel.tracks.count)
                    HomeTitle(title: "Albums")
                    ArtistsAlbumsScrollView(albums: viewModel.albums)
                    HomeTitle(title: "Tracks")
                    TracksListOfPlaylist(trackList: viewModel.tracks)
                }
            }
            .navigationTitle("Artist")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear() {
            viewModel.fetchArtistDetails(artistID: self.selectedArtistId)
        }
        
    }
    
}

#Preview {
    ArtistDetailView(selectedArtistId: 27)
}
