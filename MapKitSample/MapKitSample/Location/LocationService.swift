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
            // Get the private _mapItem property
                        let mapItem = result.value(forKey: "_mapItem") as? MKMapItem

                        return .init(
                            title: result.title,
                            subTitle: result.subtitle,
                            url: mapItem?.url
                        )
        })
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        
    }
}


extension LocationService {
    func search(with query: String, coordinate: CLLocationCoordinate2D? = nil) async throws -> [SearchResults] {
        let mapKitRequest = MKLocalSearch.Request()
        mapKitRequest.naturalLanguageQuery = query
        mapKitRequest.resultTypes = .pointOfInterest
        if let coordinate {
            mapKitRequest.region = .init(.init(origin: .init(coordinate), size: .init(width: 1, height: 1)))
            //MKCoordinateRegion(MKMapRect(origin: MKMapPoint(coordinate), size: MKMapSize(width: 1, height: 1)))
        }
        let search = MKLocalSearch(request: mapKitRequest)
        let response = try await search.start()
        
        return response.mapItems.compactMap { mapItem in
            guard let location = mapItem.placemark.location?.coordinate else {
                return nil
            }
            return .init(location: location)
        }
    }
}
