//
//  HomeViewModel.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI

final class HomeViewModel : ObservableObject, AlertShowable {
    
    var service : NetworkService
    @Published var alertItem: AlertItem?
    
    init(service : NetworkService) {
        self.service = service
    }
    
    @Published var chart : Welcome?
    
    func fetchChart() {
        service.fetchData(type: EndPointItems<Welcome>.chart) { result in
            switch result {
            case .success(let chart):
                self.chart = chart
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
    
    
}
