//
//  InstancePropertyViewController.swift
//  HardDependencies
//
//  Created by Carlos Paredes on 17/3/23.
//

import UIKit

class InstancePropertyViewController: UIViewController {

    //By declaring it lazy, the property won’t have an initial value.
    lazy var analytics = Analytics.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        analytics.track(event: "viewDidAppear - \(type(of: self))")
    }

}
