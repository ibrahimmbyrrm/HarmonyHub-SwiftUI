//
//  HomeViewModel.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI

final class HomeViewModel : ObservableObject {
    
    var service : NetworkService
    
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
                print(error)
            }
        }
    }
    
    
}
