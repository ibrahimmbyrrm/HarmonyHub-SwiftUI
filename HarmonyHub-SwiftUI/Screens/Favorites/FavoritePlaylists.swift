//
//  FavoritePlaylists.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 24.09.2023.
//

import SwiftUI

struct FavoritePlaylists: View {
    @StateObject private var viewModel = FavoritesViewModel(service: NetworkManager())
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section(isExpanded: $viewModel.isPlaylistSectionExpanded) {
                        ForEach(viewModel.favoritePlaylists.removeDuplicates(), id: \.id) { playlist in
                            NavigationLink(destination: PlaylistDetail( selectedPlaylistId: playlist.id)) {
                                PlaylistListCell(playlist: playlist)
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                viewModel.removePlaylist(index)
                            }
                        }
                    } header: {
                        Label(
                            title: { HeaderTitle(title: "Favorite Playlists") },
                            icon: { Image(systemName: "music.note.list") }
                        )
                    }

 
                    Section("Favorite Albums",isExpanded: $viewModel.isAlbumsSectionExpanded) {
                        
                    }
                    Section("Favorite Tracks",isExpanded: $viewModel.isTracksSectionExpanded) {
                        
                    }
                    
                }
                .listStyle(.sidebar)
                .navigationBarTitle("Favorites")
                .onAppear {
                    withAnimation {
                        viewModel.fetchFavorites()
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    FavoritePlaylists()
}
