//
//  Title+Description+Actions+2.swift
//  ContentUnavailableView
//
//  Created by Siddharth Kothari on 05/09/23.
//

import SwiftUI

struct Title_Description_Actions_2: View {
    var body: some View {
        ContentUnavailableView {
            Label("No Result", systemImage: "magnifyingglass")
        } description: {
            Text("Unable to fetch the data due to some error. please try again...")
                  .foregroundColor(.red)
                  .fontWeight(.medium)
        } actions: {
            HStack {
                 Button("Retry", action: {
                   print("Retry tapped")
                 })
                 Spacer()
                 Button("Cancel", action: {
                     print("Cancel tapped")
                 })
               }
        }

    }
}

#Preview {
    Title_Description_Actions_2()
}
