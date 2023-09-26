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
                                CellWithoutPreview(imageURL: playlist.pictureBig, title: playlist.title)
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                viewModel.removeItem(.playlist(0), index: index)
                            }
                        }
                    } header: {
                        Label(
                            title: { HeaderTitle(title: "Favorite Playlists") },
                            icon: { Image(systemName: "music.note.list") }
                        )
                    }
                    
                    Section(isExpanded: $viewModel.isTracksSectionExpanded) {
                        ForEach(viewModel.favoriteTracks.removeDuplicates(),id: \.id) { track in
                            NavigationLink {
                                TrackDetailView(selectedTrackID: track.id)
                            } label: {
                                FavoriteTrackCell(track: track)
                            }
                        }
                        .onDelete(perform: { indexSet in
                            for index in indexSet {
                                viewModel.removeItem(.track(0), index: index)
                            }
                        })
                    } header: {
                        Label(
                            title: { HeaderTitle(title: "Favorite Tracks") },
                            icon: { Image(systemName: "music.mic") }
                        )
                    }
                    
                    Section(isExpanded: $viewModel.isAlbumsSectionExpanded) {
                        ForEach(viewModel.favoriteAlbums.removeDuplicates(),id: \.id) { album in
                            NavigationLink {
                                AlbumDetailView(selectedalbumId: album.id)
                            } label: {
                                CellWithoutPreview(imageURL: album.coverBig, title: album.title)
                            }
                        }
                        .onDelete(perform: { indexSet in
                            for index in indexSet {
                                viewModel.removeItem(.album(0), index: index)
                            }
                        })
                    } header: {
                        Label(
                            title: { HeaderTitle(title: "Favorite Albums") },
                            icon: { Image(systemName: "rectangle.stack") }
                        )
                    }
                    
                    
                }
                .listStyle(.sidebar)
                .navigationBarTitle("Favorites")
                .onAppear {
                    withAnimation {
                        viewModel.fetchFavorites()
                    }
                }
                .onReceive(NotificationCenter.default.publisher(for: Notification.Name("removed"))) { _ in
                    viewModel.resetData()
                }
                
            }
            
        }
    }
}

#Preview {
    FavoritePlaylists()
}
