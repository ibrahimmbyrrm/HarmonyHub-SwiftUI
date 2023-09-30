//
//  AlbumDetailView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

struct AlbumDetailView: View {
    
    var selectedalbumId : Int
    @StateObject private var viewModel = AlbumDetailViewModel(service: NetworkManager())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack() {
                    MCImage(urlString: viewModel.albumDetail?.coverBig ?? "")
                        .frame(width: 300, height: 300)
                    AlbumNameAndOwnerStack(album: viewModel.albumDetail, isFavorite: $viewModel.isFavorite)
                    AlbumTracksList(tracks: viewModel.albumDetail?.tracks?.data)
                }
            }
            .navigationTitle(Constants.albumNavigationTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert(item: $viewModel.alertItem, content: { alert in
            Alert(title: alert.title, message: alert.description, dismissButton: alert.dismissButton)
        })
        .onAppear() {
            viewModel.fetchData(id: self.selectedalbumId)
            viewModel.checkFavoriteStatus(id: selectedalbumId)
        }
    }
}

#Preview {
    AlbumDetailView(selectedalbumId: 302127)
}
