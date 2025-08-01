//
//  NetworkService.swift
//  QuotesUI
//
//  Created by Drolllted on 31.07.2025.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func fetchQuotes() -> AnyPublisher<[WelcomeJSON], Error>
}

// MARK: - Network Service Implementation
final class NetworkService: NetworkServiceProtocol {
    private let apiKey = "er483/072QGJ8Y+cyVY9ZA==BtxTfeHFd2FLF6jx"
    private let baseURL = "https://api.api-ninjas.com/v1/quotes"
    
    func fetchQuotes() -> AnyPublisher<[WelcomeJSON], Error> {
        guard let url = URL(string: baseURL) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [WelcomeJSON].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
