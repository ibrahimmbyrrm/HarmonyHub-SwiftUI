//
//  AlbumNameAndOwnerStack.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

struct AlbumNameAndOwnerStack: View {
    
    var album : BaseAlbum?
    
    var body: some View {
        HStack {
            VStack(alignment : .leading) {
                Group {
                    Text(album?.title ?? "")
                        .foregroundStyle(Color(uiColor: .label))
                    Text(album?.artist?.name ?? "")
                        .foregroundStyle(Color(uiColor: .darkGray))
                }
                .font(.custom("ariel", size: 20))
                
            }
            Spacer()
        }
        .padding(.horizontal,10)
    }
}

#Preview {
    AlbumNameAndOwnerStack()
}
