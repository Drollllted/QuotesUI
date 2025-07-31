//
//  CategoriesView.swift
//  QuotesUI
//
//  Created by Drolllted on 31.07.2025.
//

import SwiftUI

struct CategoriesViewButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "rectangle.split.2x2")
                .resizable()
                .foregroundStyle(.black)
                .bold()
                .frame(width: 30, height: 30)
        }

    }
}
