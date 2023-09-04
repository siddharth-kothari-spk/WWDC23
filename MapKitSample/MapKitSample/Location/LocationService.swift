//
//  LocationService.swift
//  MapKitSample
//
//  Created by Siddharth Kothari on 03/09/23.
//

import Foundation
import Observation
import MapKit


@Observable
class LocationService: NSObject {
    private let completer: MKLocalSearchCompleter // As opposed to its MKLocalSearch counterpart, MKLocalSearchCompleter has no rate limit, so you can update the queryFragment property as often as you want and there is no need to throttle the requests yourself.
    
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
