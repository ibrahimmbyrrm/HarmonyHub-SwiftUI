//
//  TitleView.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI

struct HomeTitle : View {
    
    var title : String
    
    var body: some View {
        HStack {
            Text(title)
                .padding()
                .font(.custom("Rockwell", size: 30))
                .foregroundStyle(Color.label)
            Spacer()
        }
    }
}
#Preview {
    HomeTitle(title: "Artists")
}
