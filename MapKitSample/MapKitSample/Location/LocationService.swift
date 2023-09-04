//
//  LocationService.swift
//  MapKitSample
//
//  Created by Siddharth Kothari on 03/09/23.
//

import Foundation
import MapKit


@Observable
class LocationService: NSObject {
    private let completer: MKLocalSearchCompleter
    
    var completions = [SearchCompletions]()
    
    init(completer: MKLocalSearchCompleter) {
        self.completer = completer
        super.init()
        self.completer.delegate = self
    }
    
    func update(queryFragment: String) {
        completer.resultTypes = .pointOfInterest
        completer.queryFragment = queryFragment
    }
}

extension LocationService: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        completions = completer.results.map({ result in
                .init(title: result.title, subTitle: result.subtitle)
        })
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        
    }
}
