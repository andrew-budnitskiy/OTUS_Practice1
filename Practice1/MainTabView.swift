//
//  TabView.swift
//  Practice1
//
//  Created by Andrey Budnitskiy on 07.03.2022.
//

import SwiftUI

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

struct MainTabView: View {

    @StateObject private var tabManager = TabManager()
    @State private var needActivateLink = false

    var body: some View {
        TabView(selection: $tabManager.activeTab) {
            TabItem1()
                .tag(Tab.page1)
                .tabItem {
                    Label("Page1",
                          systemImage: "1.circle")
                }

            TabItem2()
                .tag(Tab.page2)
                .tabItem {
                    Label("Page2",
                          systemImage: "2.circle")
                }
                .onDisappear {
                    self.tabManager.needActivateLink = false
                }

            TabItem3()
                .tag(Tab.page3)
                .tabItem {
                    Label("Page3",
                          systemImage: "3.circle")
                }

        }
        .environmentObject(tabManager)
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
