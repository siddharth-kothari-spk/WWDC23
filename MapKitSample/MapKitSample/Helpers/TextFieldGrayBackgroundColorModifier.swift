//
//  TextFieldGrayBackgroundColorModifier.swift
//  MapKitSample
//
//  Created by Siddharth Kothari on 03/09/23.
//

import Foundation
import SwiftUI

struct TextFieldGrayBackgroundColor: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(.gray.opacity(0.1))
            .cornerRadius(8)
            .foregroundColor(.primary)
    }
}
