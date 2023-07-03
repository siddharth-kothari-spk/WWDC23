//
//  ContentView.swift
//  Charts Sample
//
//  Created by Siddharth Kothari on 03/07/23.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    private var coffeeSales = [
        (name: "Americano", count: 120),
        (name: "Cappuccino", count: 234),
        (name: "Espresso", count: 62),
        (name: "Latte", count: 625),
        (name: "Mocha", count: 320),
        (name: "Affogato", count: 50)
    ]
    
    var body: some View {
        
        TabView {
            // Vertical Bar
            Chart {
                ForEach(coffeeSales, id: \.name) { coffee in
                    BarMark(
                        x: .value("Type", coffee.name),
                        y: .value("Cup", coffee.count)
                    )
                    .foregroundStyle(by: .value("Type", coffee.name))
                    //.clipShape(Circle())
                }
            }
            .tabItem {
                //Image(systemName: "house.fill")
                Text("Vertical Bar")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
