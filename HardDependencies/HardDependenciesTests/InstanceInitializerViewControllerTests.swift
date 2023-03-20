@testable import HardDependencies
import XCTest

final class InstanceInitializerViewControllerTests: XCTestCase {
    func test_viewDidAppear() {
        let sut = InstanceInitializerViewController(analytics: Analytics())
        sut.loadViewIfNeeded()        
        sut.viewDidAppear(false)
    }
}
