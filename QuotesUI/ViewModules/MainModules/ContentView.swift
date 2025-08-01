//
//  ContentView.swift
//  QuotesUI
//
//  Created by Drolllted on 31.07.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm: QuotesViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 60) {
                    Image("quotes")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 161, height: 46)
                    
                    ForEach(0..<min(3, vm.quotes.count), id: \.self) { index in
                        QuotesCard(quoteIndex: index)
                            .environmentObject(vm)
                    }
                    
                    if vm.quotes.count < 3 {
                        ProgressView()
                            .padding()
                    }
                    
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            CategoriesView()
                        } label: {
                            CategoriesViewButton()
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(vm: QuotesViewModel())
}
