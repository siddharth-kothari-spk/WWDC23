//
//  SheetView.swift
//  MapKitSample
//
//  Created by Siddharth Kothari on 03/09/23.
//

import SwiftUI
import MapKit

struct SheetView: View {
    @State private var search: String = ""
    
    var body: some View {
        VStack {
            HStack(content: {
                Image(systemName: "magnifyingglass")
                TextField("Search for a restaurant", text: $search)
                    .autocorrectionDisabled()
            }).modifier(TextFieldGrayBackgroundColor())// A modifier that you apply to a view or another view modifier, producing a different version of the original value.
        }
        .padding()
    }
}

#Preview {
    SheetView()
}
