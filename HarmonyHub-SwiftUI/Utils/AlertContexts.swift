//
//  AlertContexts.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 27.09.2023.
//

import SwiftUI

protocol AlertShowable {
    var alertItem : AlertItem? {get set}
}

struct AlertItem : Identifiable{
    let id = UUID()
    let title : Text
    let description : Text
    let dismissButton : Alert.Button
}

struct AlertContext {
    //MARK: - Network Errors
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       description: Text(httpError.invalidData.rawValue),
                                       dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           description: Text(httpError.invalidResponse.rawValue),
                                           dismissButton: .default(Text("OK")))
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      description: Text(httpError.invalidURL.rawValue),
                                      dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            description: Text(httpError.noConnection.rawValue),
                                            dismissButton: .default(Text("OK")))
}
