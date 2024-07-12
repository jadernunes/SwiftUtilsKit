//
//  JSONDecoder+ExtensionTests.swift
//  
//
//  Created by Jader Nunes on 12/07/24.
//

import XCTest
@testable import SwiftUtilsKit

final class JSONDecoderExtensionTests: XCTestCase {
    
    func testDefaultEncoderWithCustomDateFormatter() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let encoder = JSONEncoder.defaultEncoder(dateFormatter: dateFormatter)
        
        // Test encoding a sample object
        let user = Person(id: 1, name: "John Doe", dateOfBirth: Date(timeIntervalSince1970: 0)) // "1970-01-01"
        
        do {
            let data = try encoder.encode(user)
            let jsonString = String(data: data, encoding: .utf8)
            XCTAssertNotNil(jsonString, "JSON string should not be nil")
            
            // Verify the encoded date
            if let jsonString = jsonString {
                XCTAssertTrue(jsonString.contains("\"dateOfBirth\":\"1969-12-31\""), "Encoded date should match the custom date format")
            }
        } catch {
            XCTFail("Encoding failed with error: \(error)")
        }
    }
    
    func testDefaultEncoderWithDefaultDateFormatter() {
        let encoder = JSONEncoder.defaultEncoder()
        
        // Test encoding a sample object
        let user = Person(id: 1, name: "John Doe", dateOfBirth: Date(timeIntervalSince1970: 0)) // "1970-01-01T00:00:00Z"
        
        do {
            let data = try encoder.encode(user)
            let jsonString = String(data: data, encoding: .utf8)
            XCTAssertNotNil(jsonString, "JSON string should not be nil")
            
            // Verify the encoded date
            if let jsonString = jsonString {
                XCTAssertTrue(jsonString.contains("\"dateOfBirth\":\"1969-12-31 09:00:00\""), "Encoded date should match the default date format")
            }
        } catch {
            XCTFail("Encoding failed with error: \(error)")
        }
    }
}

// MARK: - Helper

private struct Person: Encodable {
    let id: Int
    let name: String
    let dateOfBirth: Date
}
