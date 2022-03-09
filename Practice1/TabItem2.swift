//
//  TabItem1.swift
//  Practice1
//
//  Created by Andrey Budnitskiy on 07.03.2022.
//

import SwiftUI

//The second tabview's tab item
struct TabItem2: View {

    private let listItemCount = 10
    @EnvironmentObject private var tabManager: TabManager

    var body: some View {

        NavigationView {
            List {
                ForEach(Range<Int>(0...self.listItemCount)) { index in
                    self.navigationLinkForItem(with: index, canBeActivatedExternally: index == 2)
                }
            }.navigationTitle("List")
        }
    }

    private func navigationLinkForItem(with index: Int, canBeActivatedExternally: Bool) -> some View {

        if canBeActivatedExternally {
            return NavigationLink("Link \(index)", isActive: $tabManager.needActivateLink) {
                Text("Item \(index)")
            }
        } else {
            return NavigationLink("Link \(index)") {
                Text("Item \(index)")
            }
        }

    }

}
