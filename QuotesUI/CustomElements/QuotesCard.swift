//
//  QuotesCard.swift
//  QuotesUI
//
//  Created by Drolllted on 31.07.2025.
//
import SwiftUI

struct QuotesCard: View {
    var body: some View {
        ZStack {
            // Фон карточки
            RoundedRectangle(cornerRadius: 20)
                .fill()
                .foregroundStyle(.yellow)
                .opacity(0.5)
                .frame(width: 280, height: 280)
            
            // Основное содержимое
            VStack(alignment: .center) {
                Text("Пусть тут будет какая то красивая цитата, для того чтобы проверить как квадрат отрабатывает")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    .lineLimit(10)
                    .frame(width: 240)
                    .padding(.top, 40)
                    .offset(y: 50)
                
                Spacer()
                
                // Кнопки в нижних углах
                HStack {
                    // Левая нижняя кнопка
                    Button {
                        // Действие для кнопки
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
                    
                    // Правая нижняя кнопка
                    Button {
                        // Действие для кнопки
                    } label: {
                        Image("reload") // Убедитесь что у вас есть этот ассет
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                }
            }
        }
        .frame(width: 280, height: 280)
        .padding(10)
    }
}

#Preview {
    QuotesCard()
}
