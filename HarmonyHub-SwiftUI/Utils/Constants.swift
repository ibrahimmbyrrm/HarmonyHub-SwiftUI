//
//  Constants.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 27.09.2023.
//

import Foundation

enum Constants {
    static let homeArtistsTile = "Artists"
    static let homeTracksTitle = "Popular Tracks"
    static let homeNavigationTitle = "HarmonyHub"
    static let searchNavigationTitle = "Let's Discover"
    static let searchBarPlaceholder = "What do you want to listen ?"
    static let playlistNavigationTitle = "Playlist"
    static let artistTracksTitle = "Tracks"
    static let artistAlbumsTitle = "Albums"
    static let artistNavigationTitle = "Artist"
    static let albumNavigationTitle = "Album"
    static let favoritesNavigationTitle = "Favorites"
    static let trackNavigationTitle = "Track"
}
enum TabBarLabels {
    static let homeTitle = "home"
    static let homeImage = SFSymbols.house
    static let searchTitle = "Discover"
    static let searchImage = SFSymbols.magnifyingglass
    static let favoritesTitle = "Favorites"
    static let favoritesImage = SFSymbols.heart
}
enum SFSymbols {
    static let filledHeart = "heart.fill"
    static let heart = "heart"
    static let house = "house"
    static let magnifyingglass = "magnifyingglass"
    static let play = "play.fill"
    static let pause = "pause.fill"
}
enum Fonts {
    static let rockwell = "rockwell"
    static let ariel = "ariel"
}
enum LocaleKeys {
    static let removeNotificationKey = "removed"
    static let userDefaultsPlaylistKey = "FavoritePlaylists"
    static let userDefaultsAlbumKey = "FavoriteAlbums"
    static let userDefaultsTrackKey = "FavoriteTracks"
}
