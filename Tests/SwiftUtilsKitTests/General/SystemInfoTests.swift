//
//  SystemInfoTests.swift
//  
//
//  Created by Jader Nunes on 12/07/24.
//

import XCTest
@testable import SwiftUtilsKit

final class SystemInfoTests: XCTestCase {
    
    func testAppVersion() {
        let mockBundle = MockBundle()
        mockBundle.mockInfoDictionary = ["CFBundleShortVersionString": "1.0.0"]
        
        let systemInfo = SystemInfo(bundle: mockBundle)
        XCTAssertEqual(systemInfo.appVersion, "1.0.0", "App version should match the value in the info dictionary")
    }
    
    func testAppBuild() {
        let mockBundle = MockBundle()
        mockBundle.mockInfoDictionary = ["CFBundleVersion": "100"]
        
        let systemInfo = SystemInfo(bundle: mockBundle)
        XCTAssertEqual(systemInfo.appBuild, "100", "App build should match the value in the info dictionary")
    }
    
    func testAppVersionAndBuild() {
        let mockBundle = MockBundle()
        mockBundle.mockInfoDictionary = [
            "CFBundleShortVersionString": "1.0.0",
            "CFBundleVersion": "100"
        ]
        
        let systemInfo = SystemInfo(bundle: mockBundle)
        XCTAssertEqual(systemInfo.appVersionAndBuild, "100100", "App version and build should combine the version and build numbers without special characters")
    }
    
    func testAppVersionWhenVersionIsNil() {
        let mockBundle = MockBundle()
        mockBundle.mockInfoDictionary = [:]
        
        let systemInfo = SystemInfo(bundle: mockBundle)
        XCTAssertEqual(systemInfo.appVersion, "", "App version should be empty when version is not in the info dictionary")
    }
    
    func testAppBuildWhenBuildIsNil() {
        let mockBundle = MockBundle()
        mockBundle.mockInfoDictionary = [:]
        
        let systemInfo = SystemInfo(bundle: mockBundle)
        XCTAssertEqual(systemInfo.appBuild, "", "App build should be empty when build is not in the info dictionary")
    }
}

// MARK: - Helper

private class MockBundle: Bundle {
    var mockInfoDictionary: [String: Any]?
    
    override var infoDictionary: [String : Any]? {
        return mockInfoDictionary
    }
}
