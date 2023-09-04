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
    
    @State private var scene: MKLookAroundScene? // A utility class that encapsulates information the framework requires to retrieve and display a specific Look Around location’s imagery.
    
    var body: some View {
        Map(position: $position, selection: $selectedLocation) {
            ForEach(searchResults) { result in
                Marker(coordinate: result.location) {
                        Image(systemName: "mappin")
                }
                .tag(result) // // Marker view to show each search result on the map
            }
        }
        .overlay(alignment: .bottom, content: {
            if selectedLocation != nil {
                LookAroundPreview(scene: $scene, allowsNavigation: false, showsRoadLabels: true, pointsOfInterest: .including([.bank, .atm, .bakery, .brewery]), badgePosition: .bottomTrailing)
                    .frame(height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .safeAreaPadding(.bottom, 40)
                    .padding(.horizontal, 20)
            }
        })
            .ignoresSafeArea() // modifier to make the map view extend to the top and bottom of the screen
            .onChange(of: selectedLocation) {
                if let selectedLocation {
                    Task {
                        scene = try? await fetchScene(for: selectedLocation.location)
                    }
                }
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
    
    private func fetchScene(for coordinate: CLLocationCoordinate2D) async throws -> MKLookAroundScene? {
            let lookAroundScene = MKLookAroundSceneRequest(coordinate: coordinate)
            return try await lookAroundScene.scene
        }
}

#Preview {
    SearchableMap()
}
