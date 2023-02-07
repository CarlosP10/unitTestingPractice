//
//  MyClassTests.swift
//  LifeCycleTests
//
//  Created by Carlos Paredes on 2/3/23.
//

import XCTest
@testable import LifeCycle

final class MyClassTests: XCTestCase {
    /// Need to import @testable import LifeCycle
    /// Why do we need the @testable attribute on the import statement?
    /// That’s because we didn’t specify access control for MyClass,
    /// so it defaulted to internal access. @testable makes internal declarations visible.
    
    private var sut: MyClass!
    
    override func setUp() {
        super.setUp()
        sut = MyClass()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_methodOne() {
        sut.methodOne()
        // Normally, assert smth
    }
    
    func test_methodTwo() {
        sut.methodTwo()
    }
    
    ///Unit Tests Are FIRST: Fast, Isolated, Repeatable, Self-Verifying, and Timely
    
}
