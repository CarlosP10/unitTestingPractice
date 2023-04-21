//
//  ViewController.swift
//  TextField
//
//  Created by Carlos Paredes on 21/4/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private(set) var usernameField: UITextField!
    @IBOutlet private(set) var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    ///It prevents the user from entering spaces into the username field
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {
            if textField === usernameField {
                return !string.contains(" ")
            } else {
                return true
            }
    }
    
    ///(If you haven’t seen === before, this is not the same as checking that two values are equal. Instead,
    /// this is checking whether the textField argument is usernameField or not.)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === usernameField {
            passwordField.becomeFirstResponder()
        } else {
            guard let username = usernameField.text,
                  let password = passwordField.text else {
                return false
            }
            passwordField.becomeFirstResponder()
            performLogin(username: username, password: password)
        }
        return false
    }
    
    private func performLogin(username: String, password: String) {
        print("Username: \(username)")
        print("Password: \(password)")
    }


}

