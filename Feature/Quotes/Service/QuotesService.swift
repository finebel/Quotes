//
//  RandomQuotesService.swift
//  RandomQuotesService
//
//  Created by finebel on 30.08.21.
//

import Foundation

protocol QuotesService {
    func fetchRandomQuotes() async throws -> [Quote]
}

final class QuotesServiceImpl: QuotesService {
    func fetchRandomQuotes() async throws -> [Quote] {
        let urlSession = URLSession.shared
        guard let url = URL(string: APIConstants.baseURL.appending("/api/quotes")) else {
            throw LoadingError.invalidURL
        }
        
        let (data, response) = try await urlSession.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw LoadingError.invalidResponse(responseCode: (response as? HTTPURLResponse)?.statusCode)
        }
        
        do {
            return try JSONDecoder().decode([Quote].self, from: data)
        } catch {
            throw LoadingError.decodingError
        }
    }
}
