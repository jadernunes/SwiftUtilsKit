//
//  Data+ExtensionTests.swift
//
//
//  Created by Jader Nunes on 12/07/24.
//

import XCTest
@testable import SwiftUtilsKit

final class DataExtensionTests: XCTestCase {
    
    func testDecodedFunction() throws {
        // Define the JSON string
        let jsonString = """
            {
                "id": 1,
                "name": "John Doe"
            }
            """
        
        // Convert the JSON string to Data
        guard let jsonData = jsonString.data(using: .utf8) else {
            XCTFail("Failed to convert JSON string to Data")
            return
        }
        
        // Attempt to decode the Data to a User object
        do {
            let user: User = try jsonData.decoded(as: User.self)
            // Verify the decoded object
            XCTAssertEqual(user.id, 1)
            XCTAssertEqual(user.name, "John Doe")
        } catch {
            XCTFail("Decoding failed with error: \(error)")
        }
    }
}

// MARK: - Helper

private struct User: Codable {
    let id: Int
    let name: String
}
