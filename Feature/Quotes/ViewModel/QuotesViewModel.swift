//
//  QuotesViewModle.swift
//  QuotesViewModle
//
//  Created by finebel on 30.08.21.
//

import Foundation

protocol QuotesViewModel: ObservableObject {
    func getRandomQuotes() async
}

enum CurrentState {
    case isLoading
    case didFinishLoading(quotes: [Quote])
    case error(loadingError: LoadingErrorType)
}

@MainActor
final class QuotesViewModelImpl: QuotesViewModel {
    @Published var currentState = CurrentState.isLoading
    
    private let service: QuotesService//Protokoll wird hier genutzt. (Dependency Injection)
    
    init(service: QuotesService) {
        self.service = service
    }
    
    func getRandomQuotes() async {
        do {
            currentState = .didFinishLoading(quotes: try await service.fetchRandomQuotes())
        } catch {
            if let err = error as? LoadingError {
                currentState = .error(loadingError: LoadingErrorType(error: err))
            } else {
                currentState = .error(loadingError: LoadingErrorType(error: .unknownError))
            }
        }
    }
}
