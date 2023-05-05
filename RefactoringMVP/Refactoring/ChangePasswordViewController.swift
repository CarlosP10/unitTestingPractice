//
//  ChangePasswordViewController.swift
//  Refactoring
//
//  Created by Carlos Paredes on 27/4/23.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    @IBOutlet private(set) var cancelBarButton: UIBarButtonItem!
    @IBOutlet private(set) var oldPasswordTextField: UITextField!
    @IBOutlet private(set) var newPasswordTextField: UITextField!
    @IBOutlet private(set) var confirmPasswordTextField: UITextField!
    @IBOutlet private(set) var submitButton: UIButton!
    @IBOutlet private(set) var navigationBar: UINavigationBar!
    
    lazy var passwordChanger:PasswordChanging = PasswordChanger()
    var securityToken = ""
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    var labels: ChangePasswordLabels!
    
    private lazy var presenter = ChangePasswordPresenter(view: self,
                                                         labels: labels,
                                                         securityToken: securityToken,
                                                         passwordChanger: passwordChanger)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitButton.layer.borderWidth = 1
        submitButton.layer.borderColor = UIColor(
            red: 55/255.0, green: 147/255.0, blue: 251/255.0, alpha: 1
        ).cgColor
        submitButton.layer.cornerRadius = 8
        blurView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .white
        setLabels()
    }
    
    private func setLabels() {
        navigationBar.topItem?.title = labels.title
        oldPasswordTextField.placeholder = labels.oldPasswordPlaceholder
        newPasswordTextField.placeholder = labels.newPasswordPlaceholder
        confirmPasswordTextField.placeholder = labels.confirmPasswordPlaceholder
        submitButton.setTitle(labels.submitButtonLabel, for: .normal)
    }
    
    @IBAction private func cancel() {
        presenter.cancel()
    }
    
    @IBAction private func changePassword() {
        let passwordInputs = PasswordInputs(
            oldPassword: oldPasswordTextField.text ?? "",
            newPassword: newPasswordTextField.text ?? "",
            confirmPassword: confirmPasswordTextField.text ?? "")
        presenter.changePassword(passwordInputs: passwordInputs)
    }
    
    private func showAlert(message: String, okAction: @escaping (UIAlertAction) -> Void) {
        let alertController = UIAlertController(
            title: nil,
            message: message,
            preferredStyle: .alert)
        let okButton = UIAlertAction(
            title: labels.okButtonLabel,
            style: .default,
            handler: okAction)
        
        alertController.addAction(okButton)
        alertController.preferredAction = okButton
        self.present(alertController, animated: true)
    }
}

//MARK: - Extension UITextFieldDelegate
extension ChangePasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == oldPasswordTextField {
            updateInputFocus(.newPassword)
        } else if textField == newPasswordTextField {
            updateInputFocus(.confirmPassword)
        } else if textField == confirmPasswordTextField {
            changePassword()
        }
        return true
    }
}

//MARK: - Extension ChangePasswordViewCommands
extension ChangePasswordViewController: ChangePasswordViewCommands {
    
    func showActivityIndicator() {
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(
                equalTo: view.centerYAnchor),
        ])
        activityIndicator.startAnimating()
    }
    //Activity Indicator
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    
    func dismissModal() {
        dismiss(animated: true)
    }
    
    func showAlert(message: String,
                   action: @escaping () -> Void) {
        let wrappedAction: (UIAlertAction) -> Void = { _ in action() }
        showAlert(message: message, okAction: { wrappedAction($0) })
    }
    
    //Blur View
    func showBlurView() {
        view.backgroundColor = .clear
        view.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
    
    func hideBlurView() {
        blurView.removeFromSuperview()
        view.backgroundColor = .white
    }
    
    //Cancel button
    func setCancelButtonEnabled(_ enabled: Bool) {
        cancelBarButton.isEnabled = enabled
    }
    
    //Input Focus
    func updateInputFocus(_ inputFocus: InputFocus) {
        switch inputFocus {
        case .noKeyboard:
            view.endEditing(true)
        case .oldPassword:
            oldPasswordTextField.becomeFirstResponder()
        case .newPassword:
            newPasswordTextField.becomeFirstResponder()
        case .confirmPassword:
            confirmPasswordTextField.becomeFirstResponder()
        }
    }
    
    //Clear Password Fields
    func clearAllPasswordFields() {
        oldPasswordTextField.text = ""
        newPasswordTextField.text = ""
        confirmPasswordTextField.text = ""
    }
    
    func clearNewPasswordFields() {
        newPasswordTextField.text = ""
        confirmPasswordTextField.text = ""
    }
}
