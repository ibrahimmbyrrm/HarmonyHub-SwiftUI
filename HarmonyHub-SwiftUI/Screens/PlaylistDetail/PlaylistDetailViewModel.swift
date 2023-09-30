//
//  PlaylistDetailViewModel.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

final class PlaylistDetailViewModel : ObservableObject, AlertShowable,NetworkFetchable {
    var service : NetworkService
    @Published var detailedPlaylist : DetailedPlaylist?
    @Published var isFavorite : Bool = false
    @Published var alertItem: AlertItem?
    var trackList : [TracksDatum] {
        guard let data = detailedPlaylist?.tracks.data else {return [TracksDatum]()}
        return data
    }
    init(service: NetworkService) {
        self.service = service
    }
    
    func checkFavoriteStatus(id : Int) {
        self.isFavorite = FavoritesManager.shared.isFavorite(.playlist(id))
    }
    func fetchData(id: Int?) {
        guard let playlistId = id else {return}
        service.fetchData(type: EndPointItems<DetailedPlaylist>.playlistDetail(playlistId)) { result in
            switch result {
            case .success(let detailedPlaylist):
                self.detailedPlaylist = detailedPlaylist
                print(detailedPlaylist.id)
            case .failure(let error):
                self.handleNetworkError(error)
            }
        }
    }
    func handleNetworkError(_ error: httpError) {
        switch error {
        case .invalidData:
            self.alertItem = AlertContext.invalidData
        case .invalidResponse:
            self.alertItem = AlertContext.invalidResponse
        case .parsingError:
            self.alertItem = AlertContext.unableToComplete
        case .noConnection:
            self.alertItem = AlertContext.unableToComplete
        default:
            self.alertItem = AlertContext.unableToComplete
        }
    }

}
