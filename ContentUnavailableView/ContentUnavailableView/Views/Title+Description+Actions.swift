//
//  Title+Description+Actions.swift
//  ContentUnavailableView
//
//  Created by Siddharth Kothari on 05/09/23.
//

import SwiftUI

struct Title_Description_Actions: View {
    var body: some View {
        ContentUnavailableView {
            Text("Restricted Access")
        } description: {
            Text("To see the profile details... Please authenticate")
        } actions: {
            Button("Login", action: {
                 print("Button tapped")
            })
        }

    }
}

#Preview {
    Title_Description_Actions()
}
