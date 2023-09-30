//
//  ArtistDetailViewModel.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

final class ArtistDetailViewModel : ObservableObject, AlertShowable,NetworkFetchable {
    
    var service : NetworkService
    @Published var alertItem: AlertItem?
    @Published var artistDetails : ArtistDetail?
    @Published var tracks : [TracksDatum] = []
    @Published var albums : [BaseAlbum] = []
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func fetchData(id: Int?) {
        guard let artistID = id else {return}
        service.fetchData(type: EndPointItems<ArtistDetail>.artistDetail(artistID)) { result in
            switch result {
            case .success(let artistDetails): self.artistDetails = artistDetails
            case .failure(let error): self.handleNetworkError(error)
            }
        }
        service.fetchData(type: EndPointItems<ArtistAlbumsBase>.albumsOfArtist(artistID)) { [weak self] result in
            guard let self else {return}
            switch result {
            case .success(let artistAlbums): self.albums = artistAlbums.data
            case .failure(let error): self.handleNetworkError(error)
            }
        }
        service.fetchData(type: EndPointItems<Tracks>.tracksOfArtist(artistID)) { [weak self] result in
            guard let self else {return}
            switch result {
            case .success(let tracks): self.tracks = tracks.data
            case .failure(let error): self.handleNetworkError(error)
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
