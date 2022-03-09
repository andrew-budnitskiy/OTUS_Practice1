//
//  TabManager.swift
//  Practice1
//
//  Created by Andrew on 09.03.2022.
//

import Foundation

enum Tab {
    case page1
    case page2
    case page3
}

class TabManager: ObservableObject {

    @Published var activeTab = Tab.page1
    @Published var needActivateLink = false

    func switchTo(_ tab: Tab) {
        activeTab = tab
    }

}
