//
//  LoadingView.swift
//  LoadingView
//
//  Created by finebel on 30.08.21.
//

import SwiftUI

struct LoadingView: View {
    let title: String
    
    var body: some View {
        VStack(spacing: 8) {
            ProgressView()
            Text(title)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(title: "Fetching Quotes")
    }
}
