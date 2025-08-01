//
//  QuotesViewModel.swift
//  QuotesUI
//
//  Created by Drolllted on 31.07.2025.
//

import Foundation
import SwiftUI
import Combine

final class QuotesViewModel: ObservableObject {
    @Published var quotes: [WelcomeJSON] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private let networkProtocol: NetworkServiceProtocol
    private var cancellables: Set<AnyCancellable> = []
    
    init(networkProtocol: NetworkServiceProtocol = NetworkService()) {
        self.networkProtocol = networkProtocol
        for _ in 0..<3 {
            fetchQuotes()
        }
    }
    
    func fetchQuotes() {
        isLoading = true
        error = nil
        
        networkProtocol.fetchQuotes()
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.error = error
                }
            } receiveValue: { [weak self] newQuote in
                self?.quotes.append(contentsOf: newQuote)
            }
            .store(in: &cancellables)
    }
}
