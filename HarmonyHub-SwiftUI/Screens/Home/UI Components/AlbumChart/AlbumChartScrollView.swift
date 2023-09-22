//
//  AlbumChartScrollView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI

struct AlbumChartScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(1..<10) { _ in
                    AlbumCardView()
                        .padding(.horizontal,5)
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.init(top: 5, leading: 5, bottom: 0, trailing: 5))
    }
}

#Preview {
    AlbumChartScrollView()
}
