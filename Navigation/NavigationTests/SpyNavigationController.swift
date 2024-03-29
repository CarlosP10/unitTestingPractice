//
//  SpyNavigationController.swift
//  NavigationTests
//
//  Created by Carlos Paredes on 22/3/23.
//

import UIKit

class SpyNavigationController: UINavigationController {
    private(set) var pushViewControllerArgsAnimated: [Bool] = []
    
    override func pushViewController(
        _ viewController: UIViewController, animated: Bool) {
            super.pushViewController(viewController, animated: animated)
            pushViewControllerArgsAnimated.append(animated)
        }
}
