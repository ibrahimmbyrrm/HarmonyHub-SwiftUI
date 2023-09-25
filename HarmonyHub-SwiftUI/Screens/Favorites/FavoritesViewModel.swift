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
    @Published var favoriteTracks = [TrackDetail]()
    
    func fetchFavorites() {
        FavoritesManager.shared.getFavoritePlaylists(.playlist(0))
        for id in FavoritesManager.shared.playlistIdList {
            service.fetchData(type: EndPointItems<DetailedPlaylist>.playlistDetail(id)) { result in
                switch result {
                case .success(let playlist): self.favoritePlaylists.append(playlist)
                case .failure(let error) : print(error)
                }
            }
        }
        for id in FavoritesManager.shared.trackIdList {
            service.fetchData(type: EndPointItems<TrackDetail>.trackDetail(id)) { result in
                switch result {
                case .success(let track): self.favoriteTracks.append(track)
                case .failure(let error) : print(error)
                }
            }
        }
    }
    
    func resetData() {
        favoritePlaylists.removeAll(keepingCapacity: false)
        favoriteTracks.removeAll(keepingCapacity: false)
        fetchFavorites()
    }
    
    func removePlaylist(_ index: IndexSet.Element) {
        FavoritesManager.shared.removeFromFavorites(.playlist(favoritePlaylists[index].id), sender: .SwipeAction)
        favoritePlaylists.removeAll { $0.id == favoritePlaylists[index].id}
    }
}
