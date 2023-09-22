//
//  AlbumCardView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI

struct AlbumCardView : View {
    var body: some View {
        VStack(alignment : .leading) {
            Image("sampleAlbum")
                .resizable()
                .frame(width: 150,height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Group {
                Text("Race the Night")
                    .foregroundStyle(.primary)
                Text("Ash")
                    .foregroundStyle(Color.init(uiColor: UIColor.lightGray))
            }
            .padding(.leading,3)
        }
        
    }
}

#Preview {
    AlbumCardView()
}
