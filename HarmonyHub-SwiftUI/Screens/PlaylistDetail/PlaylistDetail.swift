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
                    PlaylistInformationConstainer(playlist: viewModel.detailedPlaylist)
                    TracksListOfPlaylist(trackList: viewModel.trackList)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Playlist")
            .padding(.top,10)
        }
        .onAppear() {
            viewModel.fetchPlaylistDetails(playlistId: self.selectedPlaylistId)
        }
    }
}

#Preview {
    PlaylistDetail(selectedPlaylistId: 7724602362)
}
