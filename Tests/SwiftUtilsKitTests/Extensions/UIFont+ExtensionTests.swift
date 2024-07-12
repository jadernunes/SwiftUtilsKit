//
//  UIFont+ExtensionTests.swift
//  
//
//  Created by Jader Nunes on 12/07/24.
//

import XCTest
@testable import SwiftUtilsKit

final class UIFontExtensionTests: XCTestCase {
    
    func testCustomFontExistingFamily() {
        // Assuming "Arial" is a valid font family available on the system
        let font = UIFont.custom(family: "Arial", size: 17)
        XCTAssertNotNil(font, "Font should not be nil for an existing font family")
        XCTAssertEqual(font.familyName, "Arial", "Font family name should match the requested family")
        XCTAssertEqual(font.pointSize, 17, "Font size should match the requested size")
    }
    
    func testCustomFontNonExistingFamily() {
        // Assuming "NonExistentFontFamily" is not a valid font family
        let defaultFont = UIFont.systemFont(ofSize: 17, weight: .regular)
        let font = UIFont.custom(family: "NonExistentFontFamily", size: 17)
        XCTAssertNotNil(font, "Font should not be nil even for a non-existing font family")
        XCTAssertEqual(font, defaultFont, "Font should be the default font for a non-existing font family")
    }
    
    func testCustomFontWithDifferentDefaultFont() {
        // Assuming "NonExistentFontFamily" is not a valid font family
        let customDefaultFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        let font = UIFont.custom(family: "NonExistentFontFamily", size: 17, defaultFont: customDefaultFont)
        XCTAssertNotNil(font, "Font should not be nil even for a non-existing font family")
        XCTAssertEqual(font, customDefaultFont, "Font should be the custom default font for a non-existing font family")
    }
    
    func testCustomFontSize() {
        let font = UIFont.custom(family: "Arial", size: 25)
        XCTAssertNotNil(font, "Font should not be nil for an existing font family")
        XCTAssertEqual(font.pointSize, 25, "Font size should match the requested size")
    }
}
