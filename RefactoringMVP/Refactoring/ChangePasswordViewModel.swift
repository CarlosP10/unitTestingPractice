//
//  ChangePasswordViewModel.swift
//  Refactoring
//
//  Created by Carlos Paredes on 3/5/23.
//

struct ChangePasswordViewModel {
    let okButtonLabel: String
    let enterNewPasswordMessage: String
    let newPasswordTooShortMessage: String
    let confirmationPasswordDoesNotMatchMessage: String
    let successMessage: String
    
    let title = "Change Password"
    let oldPasswordPlaceholder = "Current Password"
    let newPasswordPlaceholder = "New Password"
    let confirmPasswordPlaceholder = "Confirm New Password"
    let submitButtonLabel = "Submit"
    
    var isCancelButtonEnabled = true
    var isBlurViewShowing = false
    var isActivityIndicatorShowing = false
    
    var oldPassword = ""
    var newPassword = ""
    var confirmPassword = ""
    
    var isOldPasswordEmpty: Bool { oldPassword.isEmpty }
    var isNewPasswordEmpty: Bool { newPassword.isEmpty }
    var isNewPasswordTooShort: Bool { newPassword.count < 6 }
    var isConfirmPasswordMismatched: Bool { newPassword != confirmPassword }
    
    var inputFocus: InputFocus = .noKeyboard
    
    enum InputFocus {
        case noKeyboard, oldPassword, newPassword, confirmPassword
    }
}
