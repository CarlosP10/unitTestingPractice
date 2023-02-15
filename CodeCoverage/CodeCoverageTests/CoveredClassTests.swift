import XCTest
@testable import CodeCoverage

final class CoveredClassTests: XCTestCase {
    ///enable the Code Coverage check box to “Gather coverage for all targets.”
    
    
    //MARK: - Test for conditionals
    
    /// x < y
    func test_max_with1And2_shouldReturn2() {
        let result = CoveredClass.max(1, 2)
        XCTAssertEqual(result, 2)
    }
    
    /// x > y
    func test_max_with4And2_shouldReturn4() {
        let result = CoveredClass.max(4, 2)
        XCTAssertEqual(result, 4)
    }
}
