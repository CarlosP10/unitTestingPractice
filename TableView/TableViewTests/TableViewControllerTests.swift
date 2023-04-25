@testable import TableView
import XCTest

final class TableViewControllerTests: XCTestCase {
    var sut: TableViewController!
    
    override func setUp() {
        super.setUp()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: TableViewController.self))
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_tableViewDelegates_shouldBeConnected() {
        XCTAssertNotNil(sut.tableView.dataSource, "dataSource")
        XCTAssertNotNil(sut.tableView.delegate, "delegate")
    }
    
    func test_numberOfRows_shouldBe3() {
        XCTAssertEqual(numberOfRow(in: sut.tableView), 3)
    }
    
    func test_cellForRowAt_withRow0_shouldSetCellLabelToOne() {
        let cell = cellForRow(in: sut.tableView, row: 0)
        XCTAssertEqual(cell?.textLabel?.text, "One")
    }
    
    func test_cellForRowAt_withRow0_shouldSetCellLabelToTwo() {
        let cell = cellForRow(in: sut.tableView, row: 1)
        XCTAssertEqual(cell?.textLabel?.text, "Two")
    }
    
    func test_cellForRowAt_withRow0_shouldSetCellLabelToThree() {
        let cell = cellForRow(in: sut.tableView, row: 2)
        XCTAssertEqual(cell?.textLabel?.text, "Three")
    }
    
    func test_didSelectRow_withRow1() {
        didSelectRow(in: sut.tableView, row: 1)
    }
}
