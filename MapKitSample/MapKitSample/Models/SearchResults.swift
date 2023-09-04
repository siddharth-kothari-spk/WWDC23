//
//  SearchResults.swift
//  MapKitSample
//
//  Created by Siddharth Kothari on 04/09/23.
//

import Foundation
import MapKit

struct SearchResults: Identifiable {
    let id = UUID()
    let location: CLLocationCoordinate2D
}

extension SearchResults: Hashable {
    static func == (lhs: SearchResults, rhs: SearchResults) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
