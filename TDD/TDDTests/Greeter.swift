//
//  Greeter.swift
//  TDDTests
//
//  Created by Carlos Paredes on 5/5/23.
//

import Foundation

struct Greeter {
    private let name: String
    
    init(name: String) {
        self.name = name
    }
    
    private let greetingTimes: [(from: Int, greeting: String)] = [
        (0, "Good evening"),
        (5, "Good morning"),
        (12, "Good afternoon"),
        (17, "Good evening"),
        (24, "SENTINEL"),
    ]
    
    private func hour(for time: Date) -> Int{
        let components = Calendar.current.dateComponents([.hour], from: time)
        return components.hour ?? 0
    }
    
    func greet(time: Date) -> String {
        let hello = greeting(time: time)
        if name.isEmpty {
            return "\(hello)."
        } else {
            return "\(hello), \(name)."
        }
    }
    
    func greeting(time: Date) -> String {
        let theHour = hour(for: time)
        for (index, greetingTime) in greetingTimes.enumerated() {
            if greetingTime.from <= theHour &&
                theHour < greetingTimes[index + 1].from {
                return greetingTime.greeting
            }
        }
        return ""
    }
}
