@testable import HardDependencies
import XCTest

final class OverrideViewControllerTests: XCTestCase {
    func test_viewDidAppear() {
        let sut = TestableOverrideViewController()
        sut.loadViewIfNeeded()
        
        sut.viewDidAppear(false)
        
    }
}

private class TestableOverrideViewController: OverrideViewController {
    override func analytics() -> Analytics {
        Analytics()
    }
}
