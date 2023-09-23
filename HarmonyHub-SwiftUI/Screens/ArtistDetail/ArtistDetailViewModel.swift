//
//  ArtistDetailViewModel.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

final class ArtistDetailViewModel : ObservableObject {
    
    var service : NetworkService
    
    @Published var artistDetails : ArtistDetail?
    @Published var tracks : [TracksDatum] = []
    @Published var albums : [BaseAlbum] = []
    
    init(service: NetworkService) {
        self.service = service
    }
    
    
    func fetchArtistDetails(artistID: Int) {
        service.fetchData(type: EndPointItems<ArtistDetail>.artistDetail(artistID)) { result in
            switch result {
            case .success(let artistDetails): self.artistDetails = artistDetails
            case .failure(let error): print(error)
            }
        }
        service.fetchData(type: EndPointItems<ArtistAlbumsBase>.albumsOfArtist(artistID)) { [weak self] result in
            guard let self else {return}
            switch result {
            case .success(let artistAlbums): self.albums = artistAlbums.data
            case .failure(let error): print(error)
            }
        }
        service.fetchData(type: EndPointItems<Tracks>.tracksOfArtist(artistID)) { [weak self] result in
            guard let self else {return}
            switch result {
            case .success(let tracks): self.tracks = tracks.data
            case .failure(let error): print(error)
            }
        }
    }
    
}
