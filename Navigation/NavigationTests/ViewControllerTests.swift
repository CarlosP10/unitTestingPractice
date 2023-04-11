@testable import Navigation
import XCTest
import ViewControllerPresentationSpy

final class ViewControllerTests: XCTestCase {
    
    //MARK: - UNIT TEST INITCONFIG
    private var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = (storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController)
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        /// You’ll find that the presented view controller SegueNextViewController is deinitialized. To give the window a chance to disappear, add a call to execute the run loop one more time at the top of tearDown()
        executeRunLoop()
        sut = nil
        super.tearDown()
    }
    
    //MARK: - Custom Testings
    @MainActor func test_tappingCodeModalButton_shouldPresentCodeNextViewController() {
        let presentationVerifier = PresentationVerifier()
        tap(sut.codeModalButton)
        
        let codeNextVC: CodeNextViewController? = presentationVerifier.verify(animated: true, presentingViewController: sut)
        /* The verify() method checks several things:
         • That one view controller was presented
         • That it was presented with animation
         • That the presenting view controller was the system under test
         • That the type of the presented view controller is correct. And if so, it
         returns an instance of the correct type. (Otherwise, it returns nil.)
         */
        XCTAssertEqual(codeNextVC?.label.text, "Modal from code")
    }
    
    func test_tappingCodePushButton_shouldPushCodeNextViewController() {
        ///To get it to pass, we need to embed the view controller inside a navigation controller
        let navigation = UINavigationController(rootViewController: sut)
        tap(sut.codePushButton)
        
        executeRunLoop()
        XCTAssertNotNil(sut.navigationController)
        XCTAssertEqual(navigation.viewControllers.count, 2, "navigation stack")
        
        let pushedVC = navigation.viewControllers.last
        
        guard let codeNextVC = pushedVC as? CodeNextViewController else {
            XCTFail("Expected CodeNextViewController, " + "but was \(String(describing: pushedVC))")
            return
        }
        XCTAssertEqual(codeNextVC.label.text, "Pushed from code")
    }
    
    func test_INCORRECT_tappingCodeModalButton_shouldPresentCodeNextViewController() {
        UIApplication.shared.windows.first?.rootViewController = sut
        tap(sut.codeModalButton)
        
        let presentedVC = sut.presentedViewController
        guard let codeNextVC = presentedVC as? CodeNextViewController else {
            XCTFail("Expected CodeNextViewController, "
                    + "but was \(String(describing: presentedVC))")
            return
        }
        XCTAssertEqual(codeNextVC.label.text, "Modal from code")
    }
    
    @MainActor func test_tappingSeguePushButton_shouldShowSegueNextViewController() {
        let presentationVerifier = PresentationVerifier()
        ///we need to load the view con- troller into a visible UIWindow
        putInWindow(sut)
        tap(sut.seguePushButton)
        
        let segueNextVC: SegueNextViewController? = presentationVerifier.verify(animated: true, presentingViewController: sut)
        XCTAssertEqual(segueNextVC?.labelText, "Pushed from segue")
    }
    
    @MainActor func test_tappingSegueModalButton_shouldShowSegueNextViewController() {
        let presentationVerifier = PresentationVerifier()
        tap(sut.segueModalButton)
        let segueNextVC: SegueNextViewController? = presentationVerifier.verify(animated: true, presentingViewController: sut)
        XCTAssertEqual(segueNextVC?.labelText, "Modal from segue")
    }
}

// We can't use this for a view controller that comes from a storyboard.
private class TestableViewController: ViewController {
    var presentCallCount = 0
    var presentArgsViewController: [UIViewController] = []
    var presentArgsAnimated: [Bool] = []
    var presentArgsClosure: [(() -> Void)?] = []
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentCallCount += 1
        presentArgsViewController.append(viewControllerToPresent)
        presentArgsAnimated.append(flag)
        presentArgsClosure.append(completion)
    }
}
