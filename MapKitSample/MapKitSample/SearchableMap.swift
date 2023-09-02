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
    
    var body: some View {
        Map(position: $position)
            .ignoresSafeArea() // modifier to make the map view extend to the top and bottom of the screen
    }
}

#Preview {
    SearchableMap()
}
