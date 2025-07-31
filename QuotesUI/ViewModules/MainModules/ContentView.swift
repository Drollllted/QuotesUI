//
//  ContentView.swift
//  QuotesUI
//
//  Created by Drolllted on 31.07.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(spacing: 60) {
                    Image("quotes")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 161, height: 46)
                    
                    
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        CategoriesViewButton {
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
