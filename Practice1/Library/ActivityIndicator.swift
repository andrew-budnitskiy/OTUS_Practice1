//
//  ActivityIndicator.swift
//  Practice1
//
//  Created by Andrey Budnitskiy on 08.03.2022.
//

import Foundation
import UIKit
import SwiftUI

//UIKit control, that can be used in practice
struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool

    func makeUIView(context: Context) -> UIActivityIndicatorView {
            return UIActivityIndicatorView()
    }

    func updateUIView(_ activityIndicator: UIActivityIndicatorView, context: Context) {
        if isAnimating {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }

}
