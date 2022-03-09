//
//  FirstPageButtonStyle.swift
//  Practice1
//
//  Created by Andrew on 09.03.2022.
//

import Foundation
import SwiftUI

//Button style for button on first page
struct FirstPageButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled

    func makeBody(configuration: Self.Configuration) -> some View {
        let backgroundColor = Color
            .blue
            .opacity(isEnabled ? 1.0 : 0.2)
        configuration
            .label
            .padding(20)
            .foregroundColor(.white)
            .background(backgroundColor)
            .cornerRadius(20.0)
    }

}

