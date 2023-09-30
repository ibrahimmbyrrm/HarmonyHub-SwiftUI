//
//  HomeViewModel.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI

final class HomeViewModel: ObservableObject,NetworkFetchable {
    
    var service: NetworkService
    @Published var alertItem: AlertItem?
    @Published var isLoading = true
    
    private let chartEndpoint = EndPointItems<Welcome>.chart
    
    init(service: NetworkService) {
        self.service = service
    }
    
    @Published var chart: Welcome? {
        didSet {
            isLoading = false
        }
    }
    
    func fetchData(id : Int?) {
        isLoading = true
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            
            self.service.fetchData(type: self.chartEndpoint) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let chart):
                        self.chart = chart
                    case .failure(let error):
                        self.handleNetworkError(error)
                    }
                }
            }
        }
    }
    
    func handleNetworkError(_ error: httpError) {
        switch error {
        case .invalidData:
            alertItem = AlertContext.invalidData
        case .invalidResponse:
            alertItem = AlertContext.invalidResponse
        case .parsingError:
            alertItem = AlertContext.unableToComplete
        case .noConnection:
            alertItem = AlertContext.unableToComplete
        default:
            alertItem = AlertContext.unableToComplete
        }
    }
}

