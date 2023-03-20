@testable import HardDependencies
import XCTest

final class ClosureInitializerViewControllerTests: XCTestCase {
    func test_viewDidAppear() {
        let sut = ClosureInitializerViewController { Analytics() }
        sut.loadViewIfNeeded()
        sut.viewDidAppear(false)
    }
}
