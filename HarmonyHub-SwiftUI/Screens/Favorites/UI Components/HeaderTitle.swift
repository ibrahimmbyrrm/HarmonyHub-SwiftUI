//
//  HeaderTitle.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 25.09.2023.
//

import SwiftUI

struct HeaderTitle: View {
    
    var title : String
    
    var body: some View {
        Text(title)
            .font(.custom(Fonts.ariel, size: 16))
            .foregroundStyle(.indigo)
            .italic()
        
    }
}

