//
//  MySingletonAnalytics.swift
//  HardDependencies
//
//  Created by Carlos Paredes on 17/3/23.
//

import Foundation

class MySingletonAnalytics {
    
    func track(event: String) {
        Analytics.shared.track(event: event)
        
        if self !== MySingletonAnalytics.instance {
            print(">> Not the MySingletonAnalytics singleton")
        }
    }
    
    private static let instance = MySingletonAnalytics()
    
    #if DEBUG
        static var stubbedInstance: MySingletonAnalytics?
    #endif
    
    static var shared: MySingletonAnalytics {
        #if DEBUG
        if let stubbedInstance = stubbedInstance {
            return stubbedInstance
        }
        #endif
        
        return instance
    }
    
    
}
