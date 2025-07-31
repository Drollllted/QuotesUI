//
//  CategoriesView.swift
//  QuotesUI
//
//  Created by Drolllted on 31.07.2025.
//

import SwiftUI

enum Categories: String, CaseIterable {
    case family
    case friends
    case work
    case health
    case love
    case other
    
    var string: String {
        switch self {
        case .family:
            return "Family"
        case .friends:
            return "Friends"
        case .work:
            return "Work"
        case .health:
            return "Health"
        case .love:
            return "Love"
        case .other:
            return "Other"
        }
    }
}

struct CategoriesView: View {
    @State private var selectedCategory: Categories? = nil
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 40) {
                Text("What makes you feel that way?")
                    .font(.largeTitle)
                    .bold()
                Text("you can select more than one")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                
                ForEach(Categories.allCases, id: \.self) { category in
                    Button {
                        selectedCategory = (selectedCategory == category) ? nil : category
                    } label: {
                        Text(category.string)
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .frame(width: 200, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(selectedCategory == category ? .yellow : .gray)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.black, lineWidth: 1)
                            ))
                    }
                }
            }
            .navigationTitle("Categories")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CategoriesView()
}
