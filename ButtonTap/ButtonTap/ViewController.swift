//
//  ViewController.swift
//  ButtonTap
//
//  Created by Carlos Paredes on 21/3/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private(set) var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func buttonTap() {
        print(">> Button was tapped")
    }
}

