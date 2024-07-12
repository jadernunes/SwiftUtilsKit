//
//  Strings+ExtensionTests.swift
//  
//
//  Created by Jader Nunes on 12/07/24.
//

import XCTest
@testable import SwiftUtilsKit

final class StringsExtensionTests: XCTestCase {
    
    func testRemoveCharactersWithDefaultCharacters() {
        let testString = " (123) 456-7890+."
        let expectedString = "1234567890"
        XCTAssertEqual(testString.removeCharacters(), expectedString)
    }
    
    func testRemoveCharactersWithCustomCharacters() {
        let testString = "Hello, World!"
        let charactersToRemove: [Character] = ["H", "e", "o", ","]
        let expectedString = "ll Wrld!"
        XCTAssertEqual(testString.removeCharacters(charactersToRemove), expectedString)
    }
    
    func testRemoveCharactersWithEmptyCharacters() {
        let testString = "Sample Text"
        let expectedString = "Sample Text"
        XCTAssertEqual(testString.removeCharacters([]), expectedString)
    }
    
    func testOnlyNumbers() {
        let testString = "Phone: 123-456-7890"
        let expectedString = "1234567890"
        XCTAssertEqual(testString.onlyNumbers(), expectedString)
    }
    
    func testOnlyNumbersWithNoNumbers() {
        let testString = "No numbers here!"
        let expectedString = ""
        XCTAssertEqual(testString.onlyNumbers(), expectedString)
    }
}
