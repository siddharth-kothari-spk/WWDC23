//
//  SwiftData_ExampleApp.swift
//  SwiftData Example
//
//  Created by Siddharth Kothari on 30/06/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftData_ExampleApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
