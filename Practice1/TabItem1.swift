//
//  TabItem1.swift
//  Practice1
//
//  Created by Andrey Budnitskiy on 07.03.2022.
//

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
                ActivityIndicator(isAnimating: .constant(seconds > 0))
                Text("Waiting for \(seconds) sec.")
            })
        }

    }

}

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
                .padding()
                .frame(height: 60)
                .disabled(self.buttonMode.disabled)
                .buttonStyle(MyButtonStyle())


        }
    }

}

class TimerManager {

    private var timer: Timer?
    static let waitingTimeInterval = 5
    private var waitingPeriod = waitingTimeInterval

}

extension TimerManager {

    func execute(_ timeTickHandler: @escaping (Int) -> Void,
                 _ finalHandler: @escaping () -> Void) {

        self.timer?.invalidate()
        self.waitingPeriod = TimerManager.waitingTimeInterval

        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {[weak self] timer in

                            self?.waitingPeriod -= 1
                            guard (self?.waitingPeriod ?? 0) > 0 else {
                                timer.invalidate()
                                finalHandler()
                                return
                            }

                            timeTickHandler(self?.waitingPeriod ?? TimerManager.waitingTimeInterval)

                        }

    }

}

struct MyButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled

    func makeBody(configuration: Self.Configuration) -> some View {
        let backgroundColor = Color
            .blue
            .opacity(isEnabled ? 1.0 : 0.2)
        configuration.label.background(backgroundColor)
    }

}


struct TabItem1_Previews: PreviewProvider {
    static var previews: some View {
        TabItem1()
    }
}
