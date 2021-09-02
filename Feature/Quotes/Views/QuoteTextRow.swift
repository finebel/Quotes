//
//  QuotesRow.swift
//  QuotesRow
//
//  Created by finebel on 30.08.21.
//

import SwiftUI

struct QuoteTextRow: View {
    let title: String
    let text: String
    
    var body: some View {
        Group {
            Text("**\(title):**")
            +
            Text(" " + text)
                .foregroundColor(.black.opacity(0.8))
                .fontWeight(.regular)
        }
        .font(.system(size: 16, weight: .bold))
    }
}

struct QuoteTextRow_Previews: PreviewProvider {
    static var previews: some View {
        QuoteTextRow(title: "Titel", text: "Text")
    }
}
