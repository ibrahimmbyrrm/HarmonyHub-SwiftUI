//
//  FavoritesManager.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 24.09.2023.
//

import Foundation

class FavoritesManager : ObservableObject {
    static let shared = FavoritesManager()
    
    private let favoritesKey = "FavoritePlaylists"
    private let userDefaults = UserDefaults.standard
    @Published var favoriteList : [Int] = []
    
    func addFavoritePlaylist(playlistID: Int) {
        if !favoriteList.contains(playlistID) {
            favoriteList.append(playlistID)
            saveFavoritePlaylists(favoriteList)
            print("Saved on favorites -> \(playlistID)")
        }
    }
    
    func removeFavoritePlaylist(playlistID: Int) {
        print("remove called")
        if let index = favoriteList.firstIndex(of: playlistID) {
            favoriteList.remove(at: index)
            saveFavoritePlaylists(favoriteList)
            print("Removed from favorites -> \(playlistID)")
        }
    }
    
    func isFavorite(_ id : Int) -> Bool {
        for i in self.favoriteList {
            print("\(i) -- \(id) ")
            if i == id {
                return true
            }else {
                continue
            }
        }
        return false
    }
    
    func getFavoritePlaylists() {
        self.favoriteList =  userDefaults.array(forKey: favoritesKey) as? [Int] ?? []
    }
    
    private func saveFavoritePlaylists(_ playlists: [Int]) {
        userDefaults.set(playlists, forKey: favoritesKey)
        getFavoritePlaylists()
    }
}
