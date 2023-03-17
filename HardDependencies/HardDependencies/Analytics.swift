//
//  Analytics.swift
//  HardDependencies
//
//  Created by Carlos Paredes on 17/3/23.
//

import Foundation


class Analytics {
    static let shared = Analytics()
    
    func track(event: String) {
        print(">> " + event)
        if self !== Analytics.shared {
            print(">> ...Not the Analytics singleton")
        }
    }
}
