//
//  Collection+ExtensionTests.swift
//
//
//  Created by Jader Nunes on 12/07/24.
//

import XCTest
@testable import SwiftUtilsKit

final class CollectionExtensionTests: XCTestCase {
    
    func testIndex() throws {
        let array = [1, 2]
        XCTAssertNil(array[safe: -1])
        XCTAssertEqual(array[safe: 0], 1)
        XCTAssertTrue(array.isNotEmpty)
    }
}
