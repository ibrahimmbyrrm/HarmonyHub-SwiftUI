//
//  PlaylistListCell.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 25.09.2023.
//

import SwiftUI

struct CellWithoutPreview: View {
    
    var imageURL : String
    var title : String
    
    var body: some View {
        HStack {
            MCImage(urlString: imageURL)
                .frame(width: 50,height: 50)
            Text(title)
                .font(.custom("ariel", size: 18))
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
}

