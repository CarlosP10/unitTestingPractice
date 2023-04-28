@testable import Refactoring
import XCTest
import ViewControllerPresentationSpy

final class ChangePasswordViewControllerTests: XCTestCase {
    private var sut: ChangePasswordViewController!
    private var passwordChanger: MockPasswordChanger!
    private var alertVerifier: AlertVerifier!
    
    @MainActor override func setUp() {
        super.setUp()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(
            describing: ChangePasswordViewController.self))
        passwordChanger = MockPasswordChanger()
        sut.passwordChanger = passwordChanger
        alertVerifier = AlertVerifier()
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        executeRunLoop() //Clean out UIWindow
        sut = nil
        passwordChanger = nil
        alertVerifier = nil
        super.tearDown()
    }
    
    private func putOnFocus(textField: UITextField) {
        putInViewHierarchy(sut)
        textField.becomeFirstResponder()
    }
    
    func test_outlets_shouldBeConnected() {
        XCTAssertNotNil(sut.cancelBarButton,"cancelBarButton")
        XCTAssertNotNil(sut.oldPasswordTextField,"oldPasswordTextField")
        XCTAssertNotNil(sut.newPasswordTextField,"newPasswordTextField")
        XCTAssertNotNil(sut.confirmPasswordTextField,"confirmPasswordTextField")
        XCTAssertNotNil(sut.submitButton,"submitButton")
        XCTAssertNotNil(sut.navigationBar,"navigationBar")
    }
    
    ///test the title shown in the navigation bar,
    func test_navigationBar_shouldHaveTittle() {
        XCTAssertEqual(sut.navigationBar.topItem?.title, "Change Password")
    }
    
    func test_cancelBarButton_shouldBeSystemItemCancel() {
        XCTAssertEqual(systemItem(for: sut.cancelBarButton), .cancel)
    }
    
    func test_oldPasswordTextField_shouldHavePlaceholder() {
        XCTAssertEqual(sut.oldPasswordTextField.placeholder, "Current Password")
    }
    
    func test_newPasswordTextField_shouldHavePlaceholder() {
        XCTAssertEqual(sut.newPasswordTextField.placeholder, "New Password")
    }
    
    func test_confirmPasswordTextField_shouldHavePlaceholder() {
        XCTAssertEqual(sut.confirmPasswordTextField.placeholder, "Confirm New Password")
    }
    
    func test_submitButton_shouldHaveTitle() {
        XCTAssertEqual(sut.submitButton.titleLabel?.text, "Submit")
    }
    
    func test_oldPasswordTextField_shouldHavePasswordAttributes() {
        let textField = sut.oldPasswordTextField!
        XCTAssertEqual(textField.textContentType, .password, "textContentType")
        XCTAssertTrue(textField.isSecureTextEntry, "isSecureTextEntry")
        XCTAssertTrue(textField.enablesReturnKeyAutomatically, "enablesReturnKeyAutomatically")
    }
    
    func test_newPasswordTextField_shouldHavePasswordAttributes() {
        let textField = sut.newPasswordTextField!
        XCTAssertEqual(textField.textContentType, .newPassword, "textContentType")
        XCTAssertTrue(textField.isSecureTextEntry, "isSecureTextEntry")
        XCTAssertTrue(textField.enablesReturnKeyAutomatically, "enablesReturnKeyAutomatically")
    }
    
    func test_confirmPasswordTextField_shouldHavePasswordAttributes() {
        let textField = sut.confirmPasswordTextField!
        XCTAssertEqual(textField.textContentType, .newPassword, "textContentType")
        XCTAssertTrue(textField.isSecureTextEntry, "isSecureTextEntry")
        XCTAssertTrue(textField.enablesReturnKeyAutomatically, "enablesReturnKeyAutomatically")
    }
    
    func test_tappingCancel_withFocusOnOldPassword_shouldResignThatFocus() {
        putOnFocus(textField: sut.oldPasswordTextField)
        XCTAssertTrue(sut.oldPasswordTextField.isFirstResponder, "precondition")
        
        tap(sut.cancelBarButton)
        
        XCTAssertFalse(sut.oldPasswordTextField.isFirstResponder)
    }
    
    func test_tappingCancel_withFocusOnNewPassword_shouldResignThatFocus() {
        putOnFocus(textField: sut.newPasswordTextField)
        XCTAssertTrue(sut.newPasswordTextField.isFirstResponder, "precondition")
        
        tap(sut.cancelBarButton)
        
        XCTAssertFalse(sut.newPasswordTextField.isFirstResponder)
    }
    
    func test_tappingCancel_withFocusOnConfirmNewPassword_shouldResignThatFocus() {
        putOnFocus(textField: sut.confirmPasswordTextField)
        XCTAssertTrue(sut.confirmPasswordTextField.isFirstResponder, "precondition")
        
        tap(sut.cancelBarButton)
        
        XCTAssertFalse(sut.confirmPasswordTextField.isFirstResponder)
    }
    
    @MainActor func test_tappingCancel_shouldDismissModal() {
        let dismissalVerifier = DismissalVerifier()
        tap(sut.cancelBarButton)
        dismissalVerifier.verify(animated: true, dismissedViewController: sut)
    }
    
    private func setUpValidPasswordEntries() {
        sut.oldPasswordTextField.text = "NONEMPTY"
        sut.newPasswordTextField.text = "123456"
        sut.confirmPasswordTextField.text = sut.newPasswordTextField.text
    }
    
    func test_tappingSubmit_withOldPasswordEmpty_shouldNotChangePassword() {
        setUpValidPasswordEntries()
        sut.oldPasswordTextField.text = ""
        tap(sut.submitButton)
        passwordChanger.verifyChangeNeverCalled()
    }
    
    func test_tappingSubmit_withOldPasswordEmpty_shouldPutFocusOnOldPassword() {
        setUpValidPasswordEntries()
        sut.oldPasswordTextField.text = ""
        putInViewHierarchy(sut)
        
        tap(sut.submitButton)
        
        XCTAssertTrue(sut.oldPasswordTextField.isFirstResponder)
    }
    
    @MainActor private func verifyAlertPresented(
        message: String, file: StaticString = #file, line: UInt = #line){
            alertVerifier.verify(
                title: "",
                message: message,
                animated: true,
                actions: [
                    .default("OK"),
                ],
                presentingViewController: sut,
                file: file,
                line: line
            )
            XCTAssertEqual(alertVerifier.preferredAction?.title, "OK",
                           "preferred action", file: file, line: line)
    }
    
    func test_tappingSubmit_withNewPasswordEmpty_shouldNotChangePassword() {
        setUpValidPasswordEntries()
        sut.newPasswordTextField.text = ""
        
        tap(sut.submitButton)
        
        passwordChanger.verifyChangeNeverCalled()
    }
    
    @MainActor func test_tappingSubmit_withNewPasswordEmpty_shouldShowPasswordBlankAlert() {
        setUpValidPasswordEntries()
        sut.newPasswordTextField.text = ""
        
        tap(sut.submitButton)
        
        verifyAlertPresented(message: "Please enter a new password.")
    }
    
    @MainActor func test_tappingOKPasswordBlankAlert_shouldPutFocusOnNewPassword() throws {
        setUpValidPasswordEntries()
        sut.newPasswordTextField.text = ""
        tap(sut.submitButton)
        putInViewHierarchy(sut)
        
        try alertVerifier.executeAction(forButton: "OK")
        
        XCTAssertTrue(sut.newPasswordTextField.isFirstResponder)
    }
    
    private func setUpEntriesNewPasswordTooShort() {
        sut.oldPasswordTextField.text = "NONEMPTY"
        sut.newPasswordTextField.text = "12345"
        sut.confirmPasswordTextField.text = sut.newPasswordTextField.text
    }
    
    func test_tappingSubmit_withNewPasswordTooShort_shouldNotChangePassword() {
        setUpEntriesNewPasswordTooShort()
        tap(sut.submitButton)
        passwordChanger.verifyChangeNeverCalled()
    }
    
    @MainActor func test_tappingSubmit_withNewPasswordTooShort_shouldShowTooShortAlert() {
        setUpEntriesNewPasswordTooShort()
        
        tap(sut.submitButton)
        
        verifyAlertPresented(
            message: "The new password should have at least 6 characters.")
    }
    
    @MainActor func test_tappingOKInTooShortAlert_shouldClearNewAndConfirmation() throws {
        setUpEntriesNewPasswordTooShort()
        tap(sut.submitButton)
        
        try alertVerifier.executeAction(forButton: "OK")
        
        XCTAssertEqual(sut.newPasswordTextField.text?.isEmpty, true, "new")
        XCTAssertEqual(sut.confirmPasswordTextField.text?.isEmpty, true,
                       "confirmation")
    }
    
    @MainActor func test_tappingOKInTooShortAlert_shouldNotClearOldPasswordField() throws {
        setUpEntriesNewPasswordTooShort()
        tap(sut.submitButton)
        
        try alertVerifier.executeAction(forButton: "OK")
        
        XCTAssertEqual(sut.oldPasswordTextField.text?.isEmpty, false)
    }
    
    @MainActor func test_tappingOKInTooShortAlert_shouldPutFocusOnNewPassword() throws {
        setUpEntriesNewPasswordTooShort()
        tap(sut.submitButton)
        putInViewHierarchy(sut)
        
        try alertVerifier.executeAction(forButton: "OK")
        
        XCTAssertTrue(sut.newPasswordTextField.isFirstResponder)
    }
    
    private func setUpMismatchedConfirmationEntry() {
        sut.oldPasswordTextField.text = "NONEMPTY"
        sut.newPasswordTextField.text = "123456"
        sut.confirmPasswordTextField.text = "abcdef"
    }
    
    func test_tappingSubmit_withConfirmationMismatch_shouldNotChangePassword() {
        setUpMismatchedConfirmationEntry()
        tap(sut.submitButton)
        passwordChanger.verifyChangeNeverCalled()
    }
    
    @MainActor func test_tappingSubmit_withConfirmationMismatch_shouldShowMismatchAlert() {
        setUpMismatchedConfirmationEntry()
        tap(sut.submitButton)
        verifyAlertPresented(
            message: "The new password and the confirmation password " +
            "don’t match. Please try again.")
    }
    
    @MainActor func test_withConfirmationMismatch_shouldClearNewAndConfirmation() throws {
        setUpMismatchedConfirmationEntry()
        tap(sut.submitButton)
        
        try alertVerifier.executeAction(forButton: "OK")
        
        XCTAssertEqual(sut.newPasswordTextField.text?.isEmpty, true, "new")
        XCTAssertEqual(sut.confirmPasswordTextField.text?.isEmpty, true,
                       "confirmation")
    }
    
    @MainActor func test_withConfirmationMismatch_shouldNotClearOldPasswordField() throws {
        setUpMismatchedConfirmationEntry()
        tap(sut.submitButton)
        
        try alertVerifier.executeAction(forButton: "OK")
        
        XCTAssertEqual(sut.oldPasswordTextField.text?.isEmpty, false)
    }
    
    @MainActor func test_withConfirmationMismatch_shouldPutFocusOnNewPassword() throws {
        setUpMismatchedConfirmationEntry()
        tap(sut.submitButton)
        putInViewHierarchy(sut)
        
        try alertVerifier.executeAction(forButton: "OK")
        
        XCTAssertTrue(sut.newPasswordTextField.isFirstResponder)
    }
    
    //MARK: - Set the Appearance of the Waiting State
    
    func test_tappingSubmit_withValidFieldsFocusedOnOldPassword_resignsFocus() {
        setUpValidPasswordEntries()
        putOnFocus(textField: sut.oldPasswordTextField)
        XCTAssertTrue(sut.oldPasswordTextField.isFirstResponder, "precondition")
        tap(sut.submitButton)
        XCTAssertFalse(sut.oldPasswordTextField.isFirstResponder)
    }
    
    func test_tappingSubmit_withValidFieldsFocusedOnNewPassword_resignsFocus() {
        setUpValidPasswordEntries()
        putOnFocus(textField: sut.newPasswordTextField)
        XCTAssertTrue(sut.newPasswordTextField.isFirstResponder, "precondition")
        tap(sut.submitButton)
        XCTAssertFalse(sut.newPasswordTextField.isFirstResponder)
    }
    
    func test_tappingSubmit_withValidFieldsFocusedOnConfirmNewPassword_resignsFocus() {
        setUpValidPasswordEntries()
        putOnFocus(textField: sut.confirmPasswordTextField)
        XCTAssertTrue(sut.confirmPasswordTextField.isFirstResponder, "precondition")
        tap(sut.submitButton)
        XCTAssertFalse(sut.confirmPasswordTextField.isFirstResponder)
    }
    
    ///We want to prevent user interaction while the change password call
    func test_tappingSubmit_withValidFields_shouldDisableCancelBarButton() {
        setUpValidPasswordEntries()
        XCTAssertTrue(sut.cancelBarButton.isEnabled, "precondition")
        tap(sut.submitButton)
        XCTAssertFalse(sut.cancelBarButton.isEnabled)
    }
    
    func test_tappingSubmit_withValidFields_shouldShowActivityIndicator() {
        setUpValidPasswordEntries()
        XCTAssertNil(sut.activityIndicator.superview, "precondition")
        tap(sut.submitButton)
        XCTAssertNotNil(sut.activityIndicator.superview)
    }
    
    func test_tappingSubmit_withValidFields_shouldStartActivityAnimation() {
        setUpValidPasswordEntries()
        XCTAssertFalse(sut.activityIndicator.isAnimating, "precondition")
        tap(sut.submitButton)
        XCTAssertTrue(sut.activityIndicator.isAnimating)
    }
    
    func test_tappingSubmit_withValidFields_shouldClearBackgroundColorForBlur() {
        setUpValidPasswordEntries()
        XCTAssertNotEqual(sut.view.backgroundColor, .clear, "precondition")
        tap(sut.submitButton)
        XCTAssertEqual(sut.view.backgroundColor, .clear)
    }
    
    func test_tappingSubmit_withValidFields_shouldRequestChangePassword() {
        sut.securityToken = "TOKEN"
        sut.oldPasswordTextField.text = "OLD456"
        sut.newPasswordTextField.text = "NEW456"
        sut.confirmPasswordTextField.text = sut.newPasswordTextField.text
        tap(sut.submitButton)
        passwordChanger.verifyChange(
            securityToken: "TOKEN",
            oldPassword: "OLD456",
            newPassword: "NEW456"
        )
    }
    
    func test_changePasswordSuccess_shouldStopActivityIndicatorAnimation() {
        setUpValidPasswordEntries()
        tap(sut.submitButton)
        XCTAssertTrue(sut.activityIndicator.isAnimating, "precondition")
        passwordChanger.changeCallSuccess()
        XCTAssertFalse(sut.activityIndicator.isAnimating)
    }
    
    func test_changePasswordSuccess_shouldHideActivityIndicator() {
        setUpValidPasswordEntries()
        tap(sut.submitButton)
        XCTAssertNotNil(sut.activityIndicator.superview, "precondition")
        passwordChanger.changeCallSuccess()
        XCTAssertNil(sut.activityIndicator.superview)
    }
    
    func test_changePasswordFailure_shouldStopActivityIndicatorAnimation() {
        setUpValidPasswordEntries()
        tap(sut.submitButton)
        XCTAssertTrue(sut.activityIndicator.isAnimating, "precondition")
        passwordChanger.changeCallFailure(message: "DUMMY")
        XCTAssertFalse(sut.activityIndicator.isAnimating)
    }
    
    func test_changePasswordFailure_shouldHideActivityIndicator() {
        setUpValidPasswordEntries()
        tap(sut.submitButton)
        XCTAssertNotNil(sut.activityIndicator.superview, "precondition")
        passwordChanger.changeCallFailure(message: "DUMMY")
        XCTAssertNil(sut.activityIndicator.superview)
    }
}
