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
    
    @Binding var searchResults: [SearchResults] // property to update the search results. This property will be held as a @State property in the parent view so that the map can be updated accordingly.
    
    var body: some View {
        VStack {
            HStack(content: {
                Image(systemName: "magnifyingglass")
                TextField("Search for a restaurant", text: $search)
                    .autocorrectionDisabled()
                    .onSubmit {
                        // onSubmit modifier on the text field to trigger a search when the user presses the return key.
                        Task {
                            searchResults = (try? await locationService.search(with: search)) ?? []
                        }
                    }
            }).modifier(TextFieldGrayBackgroundColor())// A modifier that you apply to a view or another view modifier, producing a different version of the original value.
            Spacer()
            
            List {
                ForEach(locationService.completions) { completion in
                    Button(action: {
                        didTapOnCompletion(completion) // method to trigger a search when the user taps on a completion result.
                    }) {
                        VStack(alignment: .leading, spacing: 4.0, content: {
                            Text(completion.title)
                                .font(.headline)
                                .fontDesign(.rounded)
                            Text(completion.subTitle)
                            if let url = completion.url {
                                Link(url.absoluteString, destination: url)
                                    .lineLimit(1)
                            }
                        })
                    }
                    .listRowBackground(Color.clear) // set the row background to .clear to remove the default background styles
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden) // set the list style to .plain and the scrollContentBackground to .hidden to remove the default list styles
        }
        .onChange(of: search) {
            locationService.update(queryFragment: search)
        }
        .padding()
        .interactiveDismissDisabled() // user can not dismiss the sheet view by swiping it down
        .presentationDetents([.height(200), .large]) // PresentationDetent : A type that represents a height where a sheet naturally rests.
        .presentationBackground(.regularMaterial) // sheet view has a regular material background, giving it a nice blur effect
        // ShapeStyle: A color or pattern to use when rendering a shape.
        .presentationBackgroundInteraction(.enabled(upThrough: .large)) // sheet view's background is interactive, meaning that the user can interact with the map view behind it
        // PresentationBackgroundInteraction: The kinds of interaction available to views behind a presentation.
    }
    
    private func didTapOnCompletion(_ completion: SearchCompletions) { // method to search for the location's title and subtitle when the user taps on a completion result
        Task {
            if let singleLocation = try? await locationService.search(with: "\(completion.title) \(completion.subTitle)").first {
                searchResults = [singleLocation]
            }
        }
    }
}

//#Preview {
//    SheetView(searchResults: <#T##Binding<[SearchResults]>#>)
//}
