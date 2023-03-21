@testable import ButtonTap
import XCTest

final class ViewControllerTests: XCTestCase {
    func test_tappingButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = storyboard.instantiateViewController(
            identifier: String(describing: ViewController.self)
        )
        sut.loadViewIfNeeded()
        tap(sut.button)
    }
}
