//
//  UIColor+ExtensionTests.swift
//  
//
//  Created by Jader Nunes on 12/07/24.
//

import XCTest
@testable import SwiftUtilsKit

final class UIColorExtensionTests: XCTestCase {
    
    func testValidHexInitialization() {
        let color = UIColor(hex: "#AABBCC")
        XCTAssertNotNil(color, "Color should not be nil for a valid hex string")
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        XCTAssertEqual(red, 170/255, accuracy: 0.01)
        XCTAssertEqual(green, 187/255, accuracy: 0.01)
        XCTAssertEqual(blue, 204/255, accuracy: 0.01)
        XCTAssertEqual(alpha, 1.0, accuracy: 0.01)
    }
    
    func testValidHexInitializationWithoutHash() {
        let color = UIColor(hex: "AABBCC")
        XCTAssertNotNil(color, "Color should not be nil for a valid hex string without hash")
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        XCTAssertEqual(red, 170/255, accuracy: 0.01)
        XCTAssertEqual(green, 187/255, accuracy: 0.01)
        XCTAssertEqual(blue, 204/255, accuracy: 0.01)
        XCTAssertEqual(alpha, 1.0, accuracy: 0.01)
    }
    
    func testInvalidHexInitializationWithWrongLength() {
        let color = UIColor(hex: "#AABBCCDD")
        XCTAssertNil(color, "Color should be nil for a hex string with wrong length")
    }
    
    func testInvalidHexInitializationWithNonHexCharacters() {
        let color = UIColor(hex: "#GGHHII")
        XCTAssertNil(color, "Color should be nil for a hex string with non-hex characters")
    }
    
    func testInvalidHexInitializationWithEmptyString() {
        let color = UIColor(hex: "")
        XCTAssertNil(color, "Color should be nil for an empty hex string")
    }
}
