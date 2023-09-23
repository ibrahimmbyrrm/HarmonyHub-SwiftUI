//
//  SearchResultList.swift
//  HarmonyHub-SwiftUI
//
//  Created by İbrahim Bayram on 23.09.2023.
//

import SwiftUI

struct SearchResultList : View {
    
    @Binding var searchResults : [TracksDatum]
    
    var body: some View {
        VStack {
            ForEach(searchResults,id: \.id) { track in
                TrackCell(track: track)
                    .swipeActions() {
                        Button(action: {
                            
                        }, label: {
                            Text("Add To Playlist")
                        })
                    }
            }
            
        }
        
    }
}
