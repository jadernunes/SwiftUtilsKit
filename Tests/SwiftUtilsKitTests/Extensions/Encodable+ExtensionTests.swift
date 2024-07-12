//
//  Encodable+ExtensionTests.swift
//  
//
//  Created by Jader Nunes on 12/07/24.
//

import XCTest
@testable import SwiftUtilsKit

final class EncodableExtensionTests: XCTestCase {
    
    func testToDataWithValidEncodable() {
        let user = User(id: 1, name: "John Doe")
        let data = user.toData()
        
        XCTAssertNotNil(data, "Data should not be nil for a valid Encodable object")
        
        // Verify the content of the data
        if let data = data {
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    XCTAssertEqual(jsonObject["id"] as? Int, 1)
                    XCTAssertEqual(jsonObject["name"] as? String, "John Doe")
                } else {
                    XCTFail("Failed to convert data back to dictionary")
                }
            } catch {
                XCTFail("Failed to serialize data to JSON: \(error)")
            }
        }
    }
    
    func testToJsonWithValidEncodable() {
        let user = User(id: 1, name: "John Doe")
        let json = user.toJson()
        
        XCTAssertNotNil(json, "JSON should not be nil for a valid Encodable object")
        
        // Verify the content of the JSON dictionary
        if let json = json {
            XCTAssertEqual(json["id"] as? Int, 1)
            XCTAssertEqual(json["name"] as? String, "John Doe")
        }
    }
    
    func testToDataWithInvalidEncodable() {
        struct InvalidUser: Encodable {
            let id: Int
            let date: Date  // Dates are valid in JSON but testing different encoding scenarios
        }
        
        let user = InvalidUser(id: 1, date: Date())
        let data = user.toData()
        
        XCTAssertNotNil(data, "Data should not be nil for a valid Encodable object with custom date encoding")
    }
    
    func testToJsonWithInvalidEncodable() {
        struct InvalidUser: Encodable {
            let id: Int
            let date: Date  // Dates are valid in JSON but testing different encoding scenarios
        }
        
        let user = InvalidUser(id: 1, date: Date())
        let json = user.toJson()
        
        XCTAssertNotNil(json, "JSON should not be nil for a valid Encodable object with custom date encoding")
        
        // Additional checks if necessary
        if let json = json {
            XCTAssertEqual(json["id"] as? Int, 1)
            XCTAssertNotNil(json["date"], "Date field should be present in JSON")
        }
    }
}

// MARK: - Helper

private struct User: Codable {
    let id: Int
    let name: String
}
