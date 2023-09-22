//
//  TopButtons.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI

struct TopButtons: View {
    
    var titles = ["Tracks","Albums","Playlists","Podcasts"]
    
    var body: some View {
        HStack {
            ForEach(titles,id: \.self) { title in
                TopButton(buttonTitle: title)
            }
            Spacer()
        }
        .padding(.leading,10)
    }
    
}

#Preview {
    TopButtons()
}
