@testable import TDD
import XCTest

final class GreeterWithoutNameTests: XCTestCase {
    private var sut:Greeter!
    
    override func setUp() {
        super.setUp()
        sut = Greeter(name: "")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
        
    func test_greet_with1159am_shouldSayGoodMorning() {
        let result = sut.greet(time: date(hour: 11, minute: 59))
        
        XCTAssertEqual(result, "Good morning.")
    }
    
    func test_greet_with1200pm_shouldSayGoodAfternoon() {
        let result = sut.greet(time: date(hour: 12, minute: 00))
        
        XCTAssertEqual(result, "Good afternoon.")
    }
    
    func test_greet_with1400pm_shouldSayGoodAfternoon() {
        let result = sut.greet(time: date(hour: 14, minute: 00))
        
        XCTAssertEqual(result, "Good afternoon.")
    }
    
    func test_greet_with1659pm_shouldSayGoodAfternoon() {
        let result = sut.greet(time: date(hour: 16, minute: 59))
        
        XCTAssertEqual(result, "Good afternoon.")
    }
    
    func test_greet_with1700pm_shouldSayGoodEvening() {
        let result = sut.greet(time: date(hour: 17, minute: 00))
        
        XCTAssertEqual(result, "Good evening.")
    }
    
    func test_greet_with2359pm_shouldSayGoodEvening() {
        let result = sut.greet(time: date(hour: 23, minute: 59))
        
        XCTAssertEqual(result, "Good evening.")
    }
    
    func test_greet_with2000pm_shouldSayGoodEvening() {
        let result = sut.greet(time: date(hour: 20, minute: 00))
        
        XCTAssertEqual(result, "Good evening.")
    }
    
    func test_greet_with000am_shouldSayGoodEvening() {
        let result = sut.greet(time: date(hour: 0, minute: 00))
        
        XCTAssertEqual(result, "Good evening.")
    }
    
    func test_greet_with459am_shouldSayGoodEvening() {
        let result = sut.greet(time: date(hour: 4, minute: 59))
        
        XCTAssertEqual(result, "Good evening.")
    }
    
    func test_greet_with200am_shouldSayGoodEvening() {
        let result = sut.greet(time: date(hour: 2, minute: 00))
        
        XCTAssertEqual(result, "Good evening.")
    }
    
    func test_greet_with500am_shouldSayGoodEvening() {
        let result = sut.greet(time: date(hour: 5, minute: 00))
        
        XCTAssertEqual(result, "Good morning.")
    }
    
    func test_greet_with800am_shouldSayGoodEvening() {
        let result = sut.greet(time: date(hour: 8, minute: 00))
        
        XCTAssertEqual(result, "Good morning.")
    }
}

final class GreeterWithNameTests: XCTestCase {
    func test_greetMorning_withAlberto_shouldSayGoodMorningAlberto() {
        let sut = Greeter(name: "Alberto")
        let result = sut.greet(time: date(hour: 5, minute: 0))
        XCTAssertEqual(result, "Good morning, Alberto.")
    }
    func test_greetMorning_withBeryl_shouldSayGoodMorningBeryl() {
        let sut = Greeter(name: "Beryl")
        let result = sut.greet(time: date(hour: 15, minute: 0))
        XCTAssertEqual(result, "Good afternoon, Beryl.")
    }
    
}
