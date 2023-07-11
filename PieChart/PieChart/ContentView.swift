//
//  ContentView.swift
//  PieChart
//
//  Created by Siddharth Kothari on 11/07/23.
//

import SwiftUI

struct ContentView: View {
    private var mobileSales: [MobileSales] = ChartData.chartData()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
