//
//  TrackDetailViewModel.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 25.09.2023.
//

import SwiftUI

final class TrackDetailViewModel : ObservableObject {
    
    var service : NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    @Published var trackDetail : TrackDetail?
    @Published var isFavorite = false

    func fetchTrackDetails(id : Int) {
        service.fetchData(type: EndPointItems<TrackDetail>.trackDetail(id)) { result in
            switch result {
            case .success(let trackDetail): self.trackDetail = trackDetail
            case .failure(let error): print(error)
            }
        }
    }
    func checkFavoriteStatus(id : Int) {
        self.isFavorite = FavoritesManager.shared.isFavorite(.track(id))
    }

}
