//
//  AppDelegate.swift
//  AppLaunch
//
//  Created by Carlos Paredes on 8/3/23.
//

import UIKit

@objc(TestingAppDelegate)
class TestingAppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            print(">> Launching with testing app delegate")
            return true
        }
}

