//
//  TopButton.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 22.09.2023.
//

import SwiftUI

struct TopButton: View {
    
    var buttonTitle : String
    
    var body: some View {
        Button(action: {
            print("Tracks Tapped")
        }, label: {
            Text(buttonTitle)
                .padding(.all,10)
                .foregroundStyle(.white)
                .background(buttonTitle == "Tracks" ? Color.indigo : Color(uiColor: .lightGray))
                .clipShape(.capsule)
        })
    }
}

#Preview {
    TopButton(buttonTitle: "Tracks")
}
