//
//  SegueNextViewController.swift
//  Navigation
//
//  Created by Carlos Paredes on 21/3/23.
//

import UIKit

class SegueNextViewController: UIViewController {
    
    var labelText: String?
    
    @IBOutlet private(set) var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        label.numberOfLines = 0
        label.text = labelText
    }
    
    deinit {
        print(">> SegueNextViewController.deinit")
    }


}
