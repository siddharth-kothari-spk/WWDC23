//
//  ContentView.swift
//  ContentUnavailableView
//
//  Created by Siddharth Kothari on 05/09/23.
//

import SwiftUI
// courtsey: https://santoshbotre01.medium.com/how-to-handle-content-unavailable-gracefully-with-ios-17-5f1954c64be3

struct ContentView: View {
    var body: some View {
        VStack {
            Title_Description().padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
