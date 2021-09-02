//
//  ErrorView.swift
//  ErrorView
//
//  Created by finebel on 31.08.21.
//

import SwiftUI

struct ErrorView: View {
    let title: String
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 100))
                .foregroundColor(.orange.opacity(0.8))
            
            Text(title)
                .multilineTextAlignment(.center)
                .font(.system(.headline))
        }
        .foregroundColor(.secondary)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(title: LoadingError.invalidURL.localizedDescription)
    }
}
