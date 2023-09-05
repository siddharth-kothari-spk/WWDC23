//
//  Title+Description.swift
//  ContentUnavailableView
//
//  Created by Siddharth Kothari on 05/09/23.
//

import SwiftUI

struct Title_Description: View {
    var body: some View {
        ContentUnavailableView {
            Text("No results")
        } description: {
            Text("Search query did not yield any results")
        }

    }
}

#Preview {
    Title_Description()
}
