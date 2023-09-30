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
                    HomeTitle(title: Constants.homeArtistsTile)
                    ArtistChartScrollView(artists: viewModel.chart?.artists.data)
                    HomeTitle(title: Constants.homeTracksTitle)
                    ArtistChartGridView(tracks: viewModel.chart?.tracks.data)
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(Constants.homeNavigationTitle)
            
        }
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.description, dismissButton: alertItem.dismissButton)
        })
        .redacted(reason: viewModel.isLoading ? .placeholder : .privacy)
        .onAppear() {
            viewModel.fetchData(id: nil)
        }
        .refreshable {
            viewModel.fetchData(id: nil)
        }
    }
}
#Preview {
    HomeView()
}
