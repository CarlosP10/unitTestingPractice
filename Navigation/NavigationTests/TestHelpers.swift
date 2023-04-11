//
//  TestHelpers.swift
//  NavigationTests
//
//  Created by Carlos Paredes on 22/3/23.
//

import UIKit

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}

///Func to test UIBarButtonItem
func tap(_ button: UIBarButtonItem) {
    _ = button.target?.perform(button.action, with: nil)
}

/// we need to ask the run loop to execute one more time. This allows the push to take effect.
func executeRunLoop(){
    RunLoop.current.run(until: Date())
}

func putInWindow(_ vc: UIViewController) {
    let window = UIWindow()
    window.rootViewController = vc
    window.isHidden = false
}
