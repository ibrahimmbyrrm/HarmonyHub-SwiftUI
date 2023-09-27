//
//  AlbumDetailViewModel.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

final class AlbumDetailViewModel : ObservableObject,AlertShowable {
    
    var service : NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    @Published var alertItem: AlertItem?
    @Published var albumDetail : BaseAlbum?
    @Published var isFavorite = false
    
    func fetchAlbumDetails(albumId : Int) {
        service.fetchData(type: EndPointItems<BaseAlbum>.albumDetail(albumId)) { [weak self] result in
            guard let self else {return}
            switch result {
            case .success(let album): self.albumDetail = album
            case .failure(let error):
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
    }
    
    func checkFavoriteStatus(id : Int) {
        self.isFavorite = FavoritesManager.shared.isFavorite(.album(id))
    }
    
}
