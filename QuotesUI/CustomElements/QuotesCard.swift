//
//  QuotesCard.swift
//  QuotesUI
//
//  Created by Drolllted on 31.07.2025.
//
import SwiftUI

struct QuotesCard: View {
    @EnvironmentObject var vm: QuotesViewModel
    let quoteIndex: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill()
                .foregroundStyle(.yellow)
                .opacity(0.5)
                .frame(width: 280, height: 280)
            
            VStack(alignment: .center, spacing: 8) {
                Text(vm.quotes[safe: quoteIndex]?.quote ?? "Loading quote...")
                    .font(.system(size: 16, design: .rounded))
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .frame(width: 240)
                    .padding(.top, 40)

                Text("- " + (vm.quotes[safe: quoteIndex]?.author ?? "Unknown"))
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 40)
                
                Spacer()
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "bookmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.gray)
                            .frame(width: 20, height: 20)
                    }
                    .padding(.leading, 20)
                    .padding(.bottom, 20)
                    
                    Spacer()
                    
                    Button {
                        vm.fetchQuotes()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.gray)
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                }
            }
            .frame(width: 280, height: 280)
        }
        .frame(width: 280, height: 280)
        .padding(10)
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

#Preview {
    QuotesCard(quoteIndex: 0)
        .environmentObject(QuotesViewModel())
}
