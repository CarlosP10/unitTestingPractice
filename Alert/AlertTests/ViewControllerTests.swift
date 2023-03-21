import XCTest
import ViewControllerPresentationSpy
@testable import Alert

final class ViewControllerTests: XCTestCase {
    private var alertVerifier: AlertVerifier!
    private var sut: ViewController!
    
    @MainActor override func setUp() {
        super.setUp()
        alertVerifier = AlertVerifier()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        alertVerifier = nil
        sut = nil
        super.tearDown()
    }
    
    @MainActor func test_tappingButton_shouldShowAlert() {
        tap(sut.button)
        
        alertVerifier.verify(
            title: "Do the Thing?",
            message: "Let us know if you want to do the thing.", animated: true,
            actions: [
                .cancel("Cancel"),
                .default("OK"),
            ],
            presentingViewController: sut
        )
        XCTAssertEqual(alertVerifier.preferredAction?.title, "OK",
                       "preferred action")
    }
    
    @MainActor func test_executeAlertAction_withOKButton() throws {
        tap(sut.button)
        try alertVerifier.executeAction(forButton: "OK")
    }
    
    @MainActor func test_executeAlertAction_withCancelButton() throws {
        tap(sut.button)
        try alertVerifier.executeAction(forButton: "Cancel")
    }
}
