//
//  NSObject+ExtensionTests.swift
//  
//
//  Created by Jader Nunes on 12/07/24.
//

import XCTest
@testable import SwiftUtilsKit

final class NSObjectExtensionTests: XCTestCase {
    
    func testClassNameForType() {
        XCTAssertEqual(TestClass.className, "TestClass")
        XCTAssertEqual(AnotherTestClass.className, "AnotherTestClass")
    }
    
    func testClassNameForInstance() {
        let testInstance = TestClass()
        let anotherTestInstance = AnotherTestClass()
        
        XCTAssertEqual(testInstance.className, "TestClass")
        XCTAssertEqual(anotherTestInstance.className, "AnotherTestClass")
    }
    
    func testAsKindMethod() {
        let testInstance = TestClass()
        let anotherTestInstance = AnotherTestClass()
        
        XCTAssertNotNil(testInstance.asKind(of: TestClass.self))
        XCTAssertNil(testInstance.asKind(of: AnotherTestClass.self))
        
        XCTAssertNotNil(anotherTestInstance.asKind(of: AnotherTestClass.self))
        XCTAssertNil(anotherTestInstance.asKind(of: TestClass.self))
    }
}

// MARK: - Helper

private class TestClass: NSObject {}
private class AnotherTestClass: NSObject {}
