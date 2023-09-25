//
//  PlaylistDetailViewModel.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

final class PlaylistDetailViewModel : ObservableObject {
    var service : NetworkService
    @Published var detailedPlaylist : DetailedPlaylist?
    @Published var isFavorite : Bool = false

    var trackList : [TracksDatum] {
        guard let data = detailedPlaylist?.tracks.data else {return [TracksDatum]()}
        return data
    }
    init(service: NetworkService) {
        self.service = service
    }
    
    func checkFavoriteStatus(id : Int) {
        self.isFavorite = FavoritesManager.shared.isFavorite(.playlist(id))
        if FavoritesManager.shared.isFavorite(.playlist(id)) {
            print("Bu playlist favori")
        }else {
            print("Favori değil")
        }
    }
    
    func fetchPlaylistDetails(playlistId : Int) {
        service.fetchData(type: EndPointItems<DetailedPlaylist>.playlistDetail(playlistId)) { result in
            switch result {
            case .success(let detailedPlaylist):
                self.detailedPlaylist = detailedPlaylist
                print(detailedPlaylist.id)
            case .failure(let error): print(error)
            }
        }
    }
}
