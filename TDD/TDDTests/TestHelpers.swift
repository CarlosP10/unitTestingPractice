//
//  TestHelpers.swift
//  TDDTests
//
//  Created by Carlos Paredes on 5/5/23.
//

import Foundation

func date(hour: Int, minute: Int) -> Date {
    let components = DateComponents(
        calendar: Calendar.current, hour: hour, minute: minute)
    return components.date!
}
