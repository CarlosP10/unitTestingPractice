@testable import Refactoring
import iOSSnapshotTestCase

final class ChangePasswordViewControllerSnapshotTests: FBSnapshotTestCase {
    private var sut: ChangePasswordViewController!
    
    override func setUp() {
        super.setUp()
        recordMode = false
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(
            describing: ChangePasswordViewController.self))
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    private func setUpValidPasswordEntries() {
        sut.oldPasswordTextField.text = "NONEMPTY"
        sut.newPasswordTextField.text = "123456"
        sut.confirmPasswordTextField.text = sut.newPasswordTextField.text
    }
    
    private func verifySnapshot(file: StaticString = #file, line: UInt = #line) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.addSubview(sut.view)
        FBSnapshotVerifyViewController(sut, file: file, line: line)
    }

    func test_blur() {
        setUpValidPasswordEntries()
        tap(sut.submitButton)
        verifySnapshot()
    }
}
