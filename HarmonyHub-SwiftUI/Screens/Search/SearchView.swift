//
//  SearchView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

struct SearchView: View {

    @StateObject private var viewModel = SearchViewModel(service: NetworkManager())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    if viewModel.isSearching{
                        SearchResultList(searchResults: $viewModel.searchResults)
                    }else {
                        PlaylistGridView(columns: $viewModel.columns, playlists: $viewModel.playlists)
                    }
                }
            }
            .scrollDismissesKeyboard(.immediately)
            .navigationTitle(Constants.searchNavigationTitle)
        }
        .alert(item: $viewModel.alertItem, content: { alert in
            Alert(title: alert.title, message: alert.description, dismissButton: alert.dismissButton)
        })
        .searchable(text: $viewModel.searchText,prompt: Text(Constants.searchBarPlaceholder))
        .onAppear() {
            viewModel.fetchPlaylists()
        }
        .onChange(of: viewModel.searchText) { _, _ in
            viewModel.fetchSearchResults()
        }
        
    }
}

#Preview {
    SearchView()
}
