//
//  QuotesScreen.swift
//  QuotesScreen
//
//  Created by finebel on 30.08.21.
//

import SwiftUI

struct QuotesScreen: View {
    @StateObject private var vm = QuotesViewModelImpl(service: QuotesServiceImpl())

    var body: some View {
        NavigationView {
            Group {
                switch vm.currentState {
                case .isLoading:
                    LoadingView(title: "Fetching Quotes")
                    
                case .didFinishLoading(let quotes):
                    List {
                        ForEach(quotes) { item in
                            QuoteView(item: item)
                        }
                    }
                    
                case .error(let errorType):
                    ErrorView(title: errorType.error.localizedDescription)
                }
            }
            .navigationTitle("Quotes")
        }
        .task {
            await vm.getRandomQuotes()
        }
    }
}

struct QuotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuotesScreen()
    }
}
