//
//  PasswordInputs.swift
//  Refactoring
//
//  Created by Carlos Paredes on 5/5/23.
//

import Foundation

struct PasswordInputs {
    let oldPassword: String
    let newPassword: String
    let confirmPassword: String
    
    var isOldPasswordEmpty: Bool { oldPassword.isEmpty }
    var isNewPasswordEmpty: Bool { newPassword.isEmpty }
    var isNewPasswordTooShort: Bool { newPassword.count < 6 }
    var isConfirmPasswordMismatched: Bool { newPassword != confirmPassword }
}
