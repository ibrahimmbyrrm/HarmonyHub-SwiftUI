//
//  PlaylistDetail.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI
import Kingfisher

struct PlaylistDetail: View {

    var selectedPlaylistId : Int
    @StateObject var viewModel = PlaylistDetailViewModel(service: NetworkManager())
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    MCImage(urlString: viewModel.detailedPlaylist?.pictureXl ?? "")
                        .frame(width: 250, height: 250)
                    PlaylistInformationContainer(playlist: $viewModel.detailedPlaylist, isFavorite: $viewModel.isFavorite)
                    TracksListOfPlaylist(trackList: viewModel.trackList)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Constants.playlistNavigationTitle)
            .padding(.top,10)
        }
        .alert(item: $viewModel.alertItem, content: { alert in
            Alert(title: alert.title, message: alert.description, dismissButton: alert.dismissButton)
        })
        .onAppear() {
            viewModel.fetchData(id: self.selectedPlaylistId)
            viewModel.checkFavoriteStatus(id: self.selectedPlaylistId)
        }
    }
}

