//
//  ContentView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel(service: NetworkManager())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    TopButtons()
                    AlbumChartScrollView(albums: viewModel.chart?.albums.data)
                    HomeTitle(title: "Artists")
                    ArtistChartScrollView(artists: viewModel.chart?.artists.data)
                    HomeTitle(title: "Popular Tracks")
                    ArtistChartGridView(tracks: viewModel.chart?.tracks.data)
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("HarmonyHub")
            
        }
        .onAppear() {
            viewModel.fetchChart()
        }
    }
}
#Preview {
    HomeView()
}
