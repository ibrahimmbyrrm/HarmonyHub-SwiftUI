//
//  FavoriteTypes.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 25.09.2023.
//

import Foundation

enum RemoveSender {
    case SwipeAction
    case HeartButton
}

protocol FavoriteType{
    var userdefaultsKey : String {get}
}

enum FavoriteItems{
    case playlist(Int)
    case track(Int)
    case album(Int)
}
extension FavoriteItems : FavoriteType {
    var userdefaultsKey: String {
        switch self {
        case .playlist(_):
            "FavoritePlaylists"
        case .album(_):
            "FavoriteAlbums"
        case .track(_):
            "FavoriteTracks"
        }
    }
}
