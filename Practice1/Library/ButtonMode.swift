//
//  ButtonMode.swift
//  Practice1
//
//  Created by Andrew on 09.03.2022.
//

import Foundation
import SwiftUI

enum ButtonMode {

    case enabled
    case waiting(seconds: Int)

}

extension ButtonMode {

    var disabled: Bool {

        switch self {
        case .enabled:
            return false
        default:
            return true
        }

    }

    var buttonLabel: some View {

        switch self {
        case .enabled:
            return AnyView(Text("Open the second tab"))
        case .waiting(let seconds):
            return AnyView(HStack {
                //using of uikit control
                ActivityIndicator(isAnimating: .constant(seconds > 0))
                Text("Waiting for \(seconds) sec.")
            })
        }

    }

}
