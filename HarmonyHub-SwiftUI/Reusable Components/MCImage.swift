//
//  MCImage.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI
import Kingfisher

struct MCImage : View {
    
    var urlString : String
    
    var body: some View {
        KFImage(URL(string: urlString))
            .placeholder {
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(.indigo)
            }
            .resizable()
            .scaledToFit()
            
    }
}
