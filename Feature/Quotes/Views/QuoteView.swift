//
//  QuoteView.swift
//  QuoteView
//
//  Created by finebel on 30.08.21.
//

import SwiftUI

struct QuoteView: View {
    let item: Quote
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "tv")
                Text(item.anime)
            }
            
            QuoteTextRow(title: "Character", text: item.character)
            QuoteTextRow(title: "Quotes", text: item.quote)
                .lineLimit(2)
        }
        .padding()
        .foregroundColor(.black)
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(item: Quote.dummyData.first ?? .init(anime: "1", character: "2", quote: "3"))
    }
}
