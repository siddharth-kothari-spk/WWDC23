//
//  Title_Label+Description.swift
//  ContentUnavailableView
//
//  Created by Siddharth Kothari on 05/09/23.
//

import SwiftUI

struct Title_Label_Description: View {
    var body: some View {
        ContentUnavailableView {
            Label("Authenticate", systemImage: "faceid")
        } description: {
            Text("To see the profile details... Please authenticate")
        }
    }
}

#Preview {
    Title_Label_Description()
}
