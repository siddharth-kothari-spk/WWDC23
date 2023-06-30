//
//  Item.swift
//  SwiftData Sample
//
//  Created by Siddharth Kothari on 30/06/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var title: String
    
    init(timestamp: Date, title: String) {
        self.timestamp = timestamp
        self.title = title
    }
}
