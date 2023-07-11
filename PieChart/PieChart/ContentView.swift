//
//  ContentView.swift
//  PieChart
//
//  Created by Siddharth Kothari on 11/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        TabView {
            BarVsPie()
            .tabItem {
                Text("BarVsPie")
            }
            
            AngularInset()
            .tabItem {
                Text("AngularInset")
            }
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
