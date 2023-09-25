//
//  TrackDetailView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 25.09.2023.
//

import SwiftUI

struct TrackDetailView: View {
    
    var selectedTrackID : Int
    @StateObject private var viewModel = TrackDetailViewModel(service: NetworkManager())
    
    var body: some View {
        NavigationStack {
            VStack {
                MCImage(urlString: viewModel.trackDetail?.album.coverBig ?? "")
                    .frame(width: 250, height: 250, alignment: .center)
                TrackTitlesStackView(track: viewModel.trackDetail, isFavorite: $viewModel.isFavorite)
                Spacer()
                ArtistInfoStackView(artist: viewModel.trackDetail?.artist)
            }
            .navigationTitle("Track")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear() {
            viewModel.fetchTrackDetails(id: self.selectedTrackID)
            viewModel.checkFavoriteStatus(id: self.selectedTrackID)
        }
    }
}

#Preview {
    TrackDetailView(selectedTrackID: 2387373015)
}
