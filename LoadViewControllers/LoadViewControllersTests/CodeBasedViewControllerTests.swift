@testable import LoadViewControllers
import XCTest

final class CodeBasedViewControllerTests: XCTestCase {
    func test_loading() {
        let sut = CodeBasedViewController(data: "DUMMY")
        sut.viewDidLoad()
    }
}
