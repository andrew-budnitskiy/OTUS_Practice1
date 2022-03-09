//
//  TabItem1.swift
//  Practice1
//
//  Created by Andrey Budnitskiy on 07.03.2022.
//

import SwiftUI

//The first tabview's tab item
struct TabItem1: View {

    @EnvironmentObject private var tabManager: TabManager
    @State private var waitingPeriod = 0
    @State private var buttonMode: ButtonMode = .enabled
    private let timerManager = TimerManager()

    var body: some View {
        Button {

            self.buttonMode = .waiting(seconds: TimerManager.waitingTimeInterval)
            self.timerManager.execute { currentPeriod in
                self.buttonMode = .waiting(seconds: currentPeriod)
            } _: {
                self.buttonMode = .enabled
                self.tabManager.switchTo(.page2)
                self.tabManager.needActivateLink = true
            }

        } label: {
            self
                .buttonMode
                .buttonLabel
        }
        .disabled(self.buttonMode.disabled)
        .buttonStyle(FirstPageButtonStyle())

    }

}

struct TabItem1_Previews: PreviewProvider {
    static var previews: some View {
        TabItem1()
    }
}
