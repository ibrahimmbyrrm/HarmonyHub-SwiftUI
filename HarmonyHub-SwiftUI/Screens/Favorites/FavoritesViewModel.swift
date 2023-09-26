//
//  FavoritesViewModel.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 24.09.2023.
//

import Foundation
import Alamofire

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
    @Published var favoriteAlbums = [BaseAlbum]()
    
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
        FavoritesManager.shared.getFavoritePlaylists(.track(0))
        for id in FavoritesManager.shared.trackIdList {
            service.fetchData(type: EndPointItems<TrackDetail>.trackDetail(id)) { result in
                switch result {
                case .success(let track): self.favoriteTracks.append(track)
                case .failure(let error) : print(error)
                }
            }
        }
        FavoritesManager.shared.getFavoritePlaylists(.album(0))
        for id in FavoritesManager.shared.albumIdList {
            service.fetchData(type: EndPointItems<BaseAlbum>.albumDetail(id)) { result in
                switch result {
                case .success(let baseAlbum): self.favoriteAlbums.append(baseAlbum)
                case .failure(let error): print(error)
                }
            }
        }
    }
    
    func resetData() {
        favoritePlaylists.removeAll(keepingCapacity: false)
        favoriteTracks.removeAll(keepingCapacity: false)
        favoriteAlbums.removeAll(keepingCapacity: false)
        fetchFavorites()
    }
    
    func removeItem(_ item : FavoriteItems,index : IndexSet.Element) {
        switch item {
        case .playlist(_):
            FavoritesManager.shared.removeFromFavorites(.playlist(favoritePlaylists[index].id), sender: .SwipeAction)
            favoritePlaylists.removeAll { $0.id == favoritePlaylists[index].id}
        case .track(_):
            FavoritesManager.shared.removeFromFavorites(.track(favoriteTracks[index].id), sender: .SwipeAction)
            favoriteTracks.removeAll { $0.id == favoriteTracks[index].id }
        case .album(_):
            FavoritesManager.shared.removeFromFavorites(.album(favoriteAlbums[index].id), sender: .SwipeAction)
            favoriteAlbums.removeAll { $0.id == favoriteAlbums[index].id }
            
        }
    }
}
