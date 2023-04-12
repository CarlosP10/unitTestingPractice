//
//  ViewController.swift
//  UserDefaults
//
//  Created by Carlos Paredes on 11/4/23.
//

import UIKit

protocol UserDefaultsProtocol {
    //do stuff
    func set(_ value: Int, forKey defaultName: String)
    func integer(forKey defaultName: String) -> Int
}

extension UserDefaults: UserDefaultsProtocol {}

class ViewController: UIViewController {

    @IBOutlet private(set) var counterLabel: UILabel!
    @IBOutlet private(set) var incrementButton: UIButton!
    
    var userDefaults: UserDefaultsProtocol = UserDefaults.standard
    
    private var count = 0 {
        didSet {
            counterLabel.text = "\(count)"
            userDefaults.set(count, forKey: "count")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = userDefaults.integer(forKey: "count")
    }

    @IBAction private func incrementButtonTapped(_ sender: Any) {
        count += 1
    }
    
}

