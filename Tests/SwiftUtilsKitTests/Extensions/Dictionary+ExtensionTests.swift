//
//  Dictionary+ExtensionTests.swift
//  
//
//  Created by Jader Nunes on 12/07/24.
//

import XCTest
@testable import SwiftUtilsKit

final class DictionaryExtensionTests: XCTestCase {
    
    func testToDataWithValidDictionary() {
        let dictionary: [String: Any] = ["name": "John Doe", "age": 30, "isDeveloper": true]
        let data = dictionary.toData()
        
        XCTAssertNotNil(data, "Data should not be nil for a valid dictionary")
        
        // Verify the content of the data
        if let data = data {
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    XCTAssertEqual(jsonObject["name"] as? String, "John Doe")
                    XCTAssertEqual(jsonObject["age"] as? Int, 30)
                    XCTAssertEqual(jsonObject["isDeveloper"] as? Bool, true)
                } else {
                    XCTFail("Failed to convert data back to dictionary")
                }
            } catch {
                XCTFail("Failed to serialize data to JSON: \(error)")
            }
        }
    }
    
    func testToDataWithEmptyDictionary() {
        let dictionary: [String: Any] = [:]
        let data = dictionary.toData()
        
        XCTAssertNotNil(data, "Data should not be nil for an empty dictionary")
        
        // Verify the content of the data
        if let data = data {
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    XCTAssertTrue(jsonObject.isEmpty, "Dictionary should be empty")
                } else {
                    XCTFail("Failed to convert data back to dictionary")
                }
            } catch {
                XCTFail("Failed to serialize data to JSON: \(error)")
            }
        }
    }
}
