//
//  TimerManager.swift
//  Practice1
//
//  Created by Andrew on 09.03.2022.
//

import Foundation


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
