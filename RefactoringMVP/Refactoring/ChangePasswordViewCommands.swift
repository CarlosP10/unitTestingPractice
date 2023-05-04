//
//  ChangePasswordViewCommands.swift
//  Refactoring
//
//  Created by Carlos Paredes on 4/5/23.
//

import Foundation

protocol ChangePasswordViewCommands: AnyObject {
    func hideActivityIndicator()
    func showActivityIndicator()
    func dismissModal()
    func showAlert(message: String, action: @escaping () -> Void)
    func showBlurView()
    func hideBlurView()
    func updateInputFocus(_ inputFocus: InputFocus)
    func clearAllPasswordFields()
}

enum InputFocus {
    case noKeyboard, oldPassword, newPassword, confirmPassword
}
