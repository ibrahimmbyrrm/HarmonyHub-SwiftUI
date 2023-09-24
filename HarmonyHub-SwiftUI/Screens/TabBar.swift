//
//  TabBar.swift
//  HarmwonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI

struct TabBar: View {
    
    @StateObject var favoriteManager = FavoritesManager.shared
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            SearchView()
                .tabItem { Label("Discover", systemImage: "magnifyingglass") }
            FavoritePlaylists()
                .tabItem { Label("Favorites", systemImage: "heart") }
        }
    }
}

#Preview {
    TabBar()
}
