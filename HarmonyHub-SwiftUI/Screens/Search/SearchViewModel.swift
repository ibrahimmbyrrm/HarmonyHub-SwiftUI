//
//  SearchViewModel.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI


final class SearchViewModel : ObservableObject, AlertShowable {
    
    
    var service : NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    private let searchDelay: TimeInterval = 0.6
    @State private var searchTimer: Timer?
    @Published var playlists : [PlaylistsDatum] = []
    @Published var searchResults : [TracksDatum] = []
    @Published var columns = [GridItem(.flexible()),GridItem(.flexible())]
    @Published var searchText : String = ""
    @Published var isSearching = false
    
    @Published var alertItem: AlertItem?
 
    
    func fetchPlaylists() {
        service.fetchData(type: EndPointItems<Playlists>.playlists) { result in
            switch result {
            case .success(let playlists):
                self.playlists = playlists.data
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
    func fetchSearchResults() {
        guard searchText != "" else {
            isSearching = false
            searchResults.removeAll(keepingCapacity: false)
            return
        }
        isSearching = true
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: searchDelay, repeats: false, block: { _ in
            self.service.fetchData(type: EndPointItems<Tracks>.search(self.searchText)) { result in
                switch result {
                case .success(let tracks):
                    self.searchResults = tracks.data
                case .failure(let error):
                    print(error)
                }
            }
        })
        
    }
    
}
