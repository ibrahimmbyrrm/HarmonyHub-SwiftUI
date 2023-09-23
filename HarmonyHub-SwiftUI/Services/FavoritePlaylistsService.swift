//
//  UserDefaultsService.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import Foundation

final class FavoritePlaylistsService {
    static let shared = FavoritePlaylistsService()
    
    private init() { createFavoritesList() }
    
    func createFavoritesList() {
        let favoritesList = [Int]()
        UserDefaults.standard.set(favoritesList, forKey: "favorites")
    }

    func isFavorite(_ id : Int) -> Bool {
        var userDefaultsData = UserDefaults.standard.value(forKey: "favorites") as! [Int]
        return userDefaultsData.contains(id)
    }
    
    func removeFromFavorites(_ id : Int) {
        var userDefaultsData = UserDefaults.standard.value(forKey: "favorites") as! [Int]
        let removed = userDefaultsData.filter({ $0 != id })
        UserDefaults.standard.set(removed, forKey: "favorites")
    }
    
    func appendToFavorites(playlistId : Int) {
        var userDefaultsData = UserDefaults.standard.value(forKey: "favorites") as! [Int]
        print(userDefaultsData)
        userDefaultsData.append(playlistId)
        print(userDefaultsData)
        UserDefaults.standard.set(userDefaultsData, forKey: "favorites")
    }
    
}
