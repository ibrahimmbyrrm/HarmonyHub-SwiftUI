//
//  FavoritesUserDefaultsManager.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 25.09.2023.
//
import Foundation

class FavoritesManager : ObservableObject {
    static let shared = FavoritesManager()
    
    private let favoritesKey = "FavoritePlaylists"
    private let userDefaults = UserDefaults.standard
    
    @Published var playlistIdList = [Int]()
    @Published var trackIdList = [Int]()
    @Published var albumIdList = [Int]()
    
    func addToFavorites(_ item : FavoriteItems) {
        switch item {
        case .playlist(let playlistID):
            if !playlistIdList.contains(playlistID) {
                playlistIdList.append(playlistID)
                saveFavoriteItems(.playlist(playlistID))
            }
        case .album(let albumId):
            if !albumIdList.contains(albumId) {
                albumIdList.append(albumId)
                saveFavoriteItems(.album(albumId))
            }
        case .track(let trackId):
            if !trackIdList.contains(trackId) {
                trackIdList.append(trackId)
                saveFavoriteItems(.track(trackId))
            }
        }
    }
    
    func removeFromFavorites(_ item : FavoriteItems,sender : RemoveSender) {
        switch item {
        case .playlist(let playlistId):
            if let index = playlistIdList.firstIndex(of: playlistId) {
                playlistIdList.remove(at: index)
                saveFavoriteItems(.playlist(playlistId))
                print("Playlist removed from favorites -> \(playlistId)")
                if sender == .HeartButton {
                    NotificationCenter.default.post(name: NSNotification.Name("playlistRemoved"), object: nil)
                }
            }
        case .album(let albumId):
            if let index = albumIdList.firstIndex(of: albumId) {
                albumIdList.remove(at: index)
                saveFavoriteItems(.album(albumId))
                print("Album removed from favorites -> \(albumId)")
                NotificationCenter.default.post(name: NSNotification.Name("albumRemoved"), object: nil)
            }
        case .track(let trackId):
            if let index = trackIdList.firstIndex(of: trackId) {
                trackIdList.remove(at: index)
                saveFavoriteItems(.album(trackId))
                print("Track removed from favorites -> \(trackId)")
                NotificationCenter.default.post(name: NSNotification.Name("trackRemoved"), object: nil)
            }
        }
    }
    //MARK: - Is Favorite Check
    func isFavorite(_ item : FavoriteItems) -> Bool {
        switch item {
        case .album(let albumId): isFavorite(albumId, list: albumIdList)
        case .playlist(let playlistId): isFavorite(playlistId, list: playlistIdList)
        case .track(let trackId): isFavorite(trackId, list: trackIdList)
            
        }
    }
    
    private func isFavorite(_ id : Int,list : [Int]) -> Bool {
        for i in list {
            print("\(i) -- \(id) ")
            if i == id {
                return true
            }else {
                continue
            }
        }
        return false
    }
    
    func getFavoritePlaylists(_ item : FavoriteItems) {
        switch item {
        case .playlist(_):
            self.playlistIdList =  userDefaults.array(forKey: item.userdefaultsKey) as? [Int] ?? []
        case .album(_):
            self.albumIdList = userDefaults.array(forKey: item.userdefaultsKey) as? [Int] ?? []
        case .track(_):
            self.trackIdList = userDefaults.array(forKey: item.userdefaultsKey) as? [Int] ?? []
        }
        
    }
    
    private func saveFavoriteItems(_ item : FavoriteItems) {
        switch item {
        case .album(_):
            userDefaults.set(albumIdList, forKey: item.userdefaultsKey)
            getFavoritePlaylists(.album(0))
        case .playlist(_):
            userDefaults.set(playlistIdList,forKey: item.userdefaultsKey)
            getFavoritePlaylists(.playlist(0))
        case .track(_):
            userDefaults.set(trackIdList, forKey: item.userdefaultsKey)
            getFavoritePlaylists(.track(0))
        }
    }

}
