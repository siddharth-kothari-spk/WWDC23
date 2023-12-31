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
            Spacer(minLength: 100)
            Title_Label_Description().padding(EdgeInsets(top: 5.0, leading: 5.0, bottom: 5.0, trailing: 5.0))
            Title_Description_Actions().padding()
            Title_Description_Actions_2().padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
