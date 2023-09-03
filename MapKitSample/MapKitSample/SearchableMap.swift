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
    
    var body: some View {
        Map(position: $position)
            .ignoresSafeArea() // modifier to make the map view extend to the top and bottom of the screen
            .sheet(isPresented: $isSheetPresented, content: {
                SheetView()
            }) // add a sheet overlay with a custom view that allows the user to search for locations
        
    }
}

#Preview {
    SearchableMap()
}
