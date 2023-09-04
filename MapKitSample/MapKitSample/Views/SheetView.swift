//
//  SheetView.swift
//  MapKitSample
//
//  Created by Siddharth Kothari on 03/09/23.
//

import SwiftUI
import MapKit

struct SheetView: View {
    @State private var locationService = LocationService(completer: .init()) // new state property to hold the location service instance
    @State private var search: String = ""
    
    var body: some View {
        VStack {
            HStack(content: {
                Image(systemName: "magnifyingglass")
                TextField("Search for a restaurant", text: $search)
                    .autocorrectionDisabled()
            }).modifier(TextFieldGrayBackgroundColor())// A modifier that you apply to a view or another view modifier, producing a different version of the original value.
            Spacer()
            
            List {
                ForEach(locationService.completions) { completion in
                    Button(action: {}) {
                        VStack(alignment: .leading, spacing: 4.0, content: {
                            Text(completion.title)
                                .font(.headline)
                                .fontDesign(.rounded)
                            Text(completion.subTitle)
                        })
                    }
                    
                }
            }
        }
        .padding()
        .interactiveDismissDisabled() // user can not dismiss the sheet view by swiping it down
        .presentationDetents([.height(200), .large]) // PresentationDetent : A type that represents a height where a sheet naturally rests.
        .presentationBackground(.regularMaterial) // sheet view has a regular material background, giving it a nice blur effect
        // ShapeStyle: A color or pattern to use when rendering a shape.
        .presentationBackgroundInteraction(.enabled(upThrough: .large)) // sheet view's background is interactive, meaning that the user can interact with the map view behind it
        // PresentationBackgroundInteraction: The kinds of interaction available to views behind a presentation.
    }
}

#Preview {
    SheetView()
}
