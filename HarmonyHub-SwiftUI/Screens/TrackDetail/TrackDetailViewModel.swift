//
//  TrackDetailViewModel.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 25.09.2023.
//

import SwiftUI

final class TrackDetailViewModel : ObservableObject, AlertShowable,NetworkFetchable {
    
    var service : NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    @Published var alertItem: AlertItem?
    @Published var trackDetail : TrackDetail?
    @Published var isFavorite = false
    
    func fetchData(id: Int?) {
        guard let id else {return}
        service.fetchData(type: EndPointItems<TrackDetail>.trackDetail(id)) { result in
            switch result {
            case .success(let trackDetail): self.trackDetail = trackDetail
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

    func checkFavoriteStatus(id : Int) {
        self.isFavorite = FavoritesManager.shared.isFavorite(.track(id))
    }

}
