//
//  ViewModelContract.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 30.09.2023.
//

import Foundation

protocol NetworkFetchable {
    var alertItem : AlertItem? {get set}
    func fetchData(id: Int?)
    func handleNetworkError(_ error : httpError)
}


