//
//  SearchableMap.swift
//  MapKitSample
//
//  Created by Siddharth Kothari on 02/09/23.
//

import SwiftUI
import MapKit

struct SearchableMap: View {
    @State private var position = MapCameraPosition.automatic // map will automatically zoom and pan to show all of the annotations that are added
    @State private var isSheetPresented: Bool = true
    
    @State private var searchResults = [SearchResults]() // property to hold the search results
    @State private var selectedLocation: SearchResults? // property to hold the selected location.
    
    var body: some View {
        Map(position: $position, selection: $selectedLocation) {
            ForEach(searchResults) { result in
                Marker(coordinate: result.location) {
                        Image(systemName: "mappin")
                }
                .tag(result) // // Marker view to show each search result on the map
            }
        }
            .ignoresSafeArea() // modifier to make the map view extend to the top and bottom of the screen
            .onChange(of: selectedLocation) {
                isSheetPresented = selectedLocation == nil
                // update the SearchableMap view to dismiss the sheet when a location is selected
            }
            .onChange(of: searchResults) {
                if let firstResult = searchResults.first, searchResults.count == 1 {
                        selectedLocation = firstResult
                    }
                // update the SearchableMap view to select the first location if there is only one result
            }
            .sheet(isPresented: $isSheetPresented, content: {
                SheetView(searchResults: $searchResults)
            }) // add a sheet overlay with a custom view that allows the user to search for locations
    }
}

#Preview {
    SearchableMap()
}
