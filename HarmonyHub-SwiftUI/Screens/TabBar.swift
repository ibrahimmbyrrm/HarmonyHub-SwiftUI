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
                .tabItem { Label(TabBarLabels.homeTitle, systemImage: TabBarLabels.homeImage) }
            SearchView()
                .tabItem { Label(TabBarLabels.searchTitle, systemImage: TabBarLabels.searchImage) }
            FavoritePlaylists()
                .tabItem { Label(TabBarLabels.favoritesTitle, systemImage: TabBarLabels.favoritesImage) }
        }
    }
}

#Preview {
    TabBar()
}
