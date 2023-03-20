//
//  OverrideViewController.swift
//  HardDependencies
//
//  Created by Carlos Paredes on 17/3/23.
//

import UIKit

class OverrideViewController: UIViewController {

    func analytics() -> Analytics { Analytics.shared }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        analytics().track(event: "viewDidAppear - \(type(of: self))")
    }
    
    
}
