//
//  FavoritesViewModel.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 24.09.2023.
//

import Foundation

final class FavoritesViewModel : ObservableObject {
    
    var service : NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    @Published var isPlaylistSectionExpanded = true
    @Published var isTracksSectionExpanded = true
    @Published var isAlbumsSectionExpanded = true
    @Published var favoritePlaylists : [DetailedPlaylist] = []
    
    func fetchFavorites() {
        favoritePlaylists.removeAll(keepingCapacity: false)
        FavoritesManager.shared.getFavoritePlaylists()
        for id in FavoritesManager.shared.favoriteList {
            service.fetchData(type: EndPointItems<DetailedPlaylist>.playlistDetail(id)) { result in
                switch result {
                case .success(let playlist):
                        self.favoritePlaylists.append(playlist)
                case .failure(let error) : print(error)
                }
            }
        }
    }
    
    func removePlaylist(_ index: IndexSet.Element) {
        FavoritesManager.shared.removeFavoritePlaylist(playlistID: favoritePlaylists[index].id)
        favoritePlaylists.removeAll { $0.id == favoritePlaylists[index].id}
    }
}
