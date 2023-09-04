//
//  SearchCompletions.swift
//  MapKitSample
//
//  Created by Siddharth Kothari on 04/09/23.
//

import Foundation

struct SearchCompletions: Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String
    var url: URL? // New property to hold the URL if it exists
}

