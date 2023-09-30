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
                    HomeTitle(title: Constants.artistAlbumsTitle)
                    ArtistsAlbumsScrollView(albums: viewModel.albums)
                    HomeTitle(title: Constants.artistTracksTitle)
                    TracksListOfPlaylist(trackList: viewModel.tracks)
                }
            }
            .navigationTitle(Constants.artistNavigationTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert(item: $viewModel.alertItem, content: { alert in
            Alert(title: alert.title, message: alert.description, dismissButton: alert.dismissButton)
        })
        .onAppear() {
            viewModel.fetchData(id: self.selectedArtistId)
        }
        
    }
    
}

#Preview {
    ArtistDetailView(selectedArtistId: 27)
}
