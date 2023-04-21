@testable import TextField
import XCTest

final class ViewControllerTests: XCTestCase {
    private var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(
            identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_outlets_shouldBeConnected() {
        
        XCTAssertNotNil(sut.usernameField, "usernameField")
        XCTAssertNotNil(sut.passwordField, "passwordField")
    }
    
    func test_usernameField_attributesShouldBeSet() {
        let textField = sut.usernameField!
        XCTAssertEqual(textField.textContentType, .username, "textContentType")
        XCTAssertEqual(textField.autocorrectionType, .no, "textContentType")
        XCTAssertEqual(textField.returnKeyType, .next, "textContentType")
    }
    
    func test_passwordField_attributesShouldBeSet() {
        let passwordField = sut.passwordField!
        XCTAssertEqual(passwordField.textContentType, .password, "textContentType")
        XCTAssertEqual(passwordField.returnKeyType, .go, "returnKeyType")
        XCTAssertTrue(passwordField.isSecureTextEntry, "isSecureTextEntry")
    }
}
