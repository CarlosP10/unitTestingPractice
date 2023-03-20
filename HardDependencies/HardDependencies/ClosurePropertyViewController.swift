//
//  ClosurePropertyViewController.swift
//  HardDependencies
//
//  Created by Carlos Paredes on 17/3/23.
//

import UIKit

class ClosurePropertyViewController: UIViewController {
    
    var makeAnalytics: () -> Analytics = { Analytics.shared }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(animated)
        makeAnalytics().track(event: "viewDidAppear - \(type(of: self))")
    }
    
}
