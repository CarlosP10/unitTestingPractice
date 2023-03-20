//
//  InstanceInitializerViewController.swift
//  HardDependencies
//
//  Created by Carlos Paredes on 17/3/23.
//

import UIKit

class InstanceInitializerViewController: UIViewController {

    private let analytics: Analytics
    
    init(analytics: Analytics) {
        self.analytics = analytics
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        analytics.track(event: "viewDidAppear - \(type(of: self))")
    }
}
