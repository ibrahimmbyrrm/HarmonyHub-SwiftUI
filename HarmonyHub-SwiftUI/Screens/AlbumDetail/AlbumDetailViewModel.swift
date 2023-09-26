//
//  AlbumDetailViewModel.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

final class AlbumDetailViewModel : ObservableObject {
    
    var service : NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    @Published var albumDetail : BaseAlbum?
    @Published var isFavorite = false
    
    func fetchAlbumDetails(albumId : Int) {
        service.fetchData(type: EndPointItems<BaseAlbum>.albumDetail(albumId)) { [weak self] result in
            guard let self else {return}
            switch result {
            case .success(let album): self.albumDetail = album
            case .failure(let error): print(error)
            }
        }
    }
    
    func checkFavoriteStatus(id : Int) {
        self.isFavorite = FavoritesManager.shared.isFavorite(.album(id))
    }
    
}
