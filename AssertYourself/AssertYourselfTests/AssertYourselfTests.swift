//
//  AssertYourselfTests.swift
//  AssertYourselfTests
//
//  Created by Carlos Paredes on 2/2/23.
//

import XCTest
@testable import AssertYourself

final class AssertYourselfTests: XCTestCase {

    func test_fail() {
//        XCTFail()
    }
    
    func test_fail_withSimpleMessage() {
//        XCTFail("We have a problem")
    }
    
    func test_fail_withInterpolatedMessage() {
//        let theAnswer = 42
//        XCTFail("The Answer to the Great Question is \(theAnswer)")
    }
    
    //MARK: - Avoid Conditionals in Tests
    /// By using the Boolean assertions XCTAssertTrue() and XCTAssertFalse(), we can avoid many conditionals in our test code
    func test_assertTrue() {
        let success = true
        XCTAssertTrue(success)
    }
    
    //MARK: - Describe Objects upon Failure
    func test_assertNil() {
        let optionalValue: Int? = nil
        XCTAssertNil(optionalValue)
    }
    
    struct SimpleStruct {
        let x: Int
        let y: Int
    }
    
    func test_assertNil_withSimpleStruct() {
//        let optionalValue: SimpleStruct? = SimpleStruct(x: 1, y: 2)
//        XCTAssertNil(optionalValue)
    }
    
    /// We can control how a type describes itself by making it conform to CustomStringConvertible.
    struct StructWithDescription: CustomStringConvertible {
        let x: Int
        let y: Int
        
        var description: String { "(\(x), \(y))"}
    }
    
    func test_assertNil_withSelfDescribingType() {
//        let optionalValue: StructWithDescription? = StructWithDescription(x: 1, y: 2)
//        XCTAssertNil(optionalValue)
    }
    
    //MARK: - Test for Equality

    func test_assertEqual() {
//        let actual = "actual"
//        XCTAssertEqual(actual, "expected")
    }
    
    //MARK: - Test Equality with Optionals
    
    func test_assertEqual_withOptional() {
//        let result: String? = "foo"
//        XCTAssertEqual(result, "bar")
    }
    
    //MARK: - Fudge Equality with Doubles and Floats
    func test_floatingPointDanger() {
//        let result = 0.1 + 0.2
//        XCTAssertEqual(result, 0.3)
    }
    
    /// The accuracy parameter gives us a way to express the “more or less” fudge factor
    func test_floatingPointFixed() {
        let result = 0.1 + 0.2
        XCTAssertEqual(result, 0.3, accuracy: 0.0001)
    }
    
    func test_messageOverkill() {
        let actual = "actual"
        XCTAssertEqual(actual, "expected","Expected \"expected\" but got \"\(actual)\"")
    }
}
