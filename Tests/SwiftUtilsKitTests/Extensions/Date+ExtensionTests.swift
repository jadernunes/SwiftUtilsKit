//
//  Date+ExtensionTests.swift
//
//
//  Created by Jader Nunes on 12/07/24.
//

import XCTest
@testable import SwiftUtilsKit

final class DateExtensionTests: XCTestCase {
    
    func testDayFunction() {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: 2024, month: 7, day: 12)
        let date = calendar.date(from: dateComponents)!
        
        XCTAssertEqual(date.day(calendar: calendar), 12)
    }
    
    func testToStringFunction() {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: 2024, month: 7, day: 12)
        let date = calendar.date(from: dateComponents)!
        
        let dateString = date.toString(format: "yyyy-MM-dd")
        XCTAssertEqual(dateString, "2024-07-12")
    }
    
    func testToFormatFunction() {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: 2024, month: 7, day: 12)
        let date = calendar.date(from: dateComponents)!
        
        let formattedDate = date.toFormat("yyyy-MM-dd")
        XCTAssertEqual(formattedDate, date)
    }
    
    func testDayWithSuffixFunction() {
        let calendar = Calendar.current
        
        // 1st
        var dateComponents = DateComponents(year: 2024, month: 7, day: 1)
        var date = calendar.date(from: dateComponents)!
        XCTAssertEqual(date.dayWihSuffix(calendar: calendar), "1st")
        
        // 2nd
        dateComponents.day = 2
        date = calendar.date(from: dateComponents)!
        XCTAssertEqual(date.dayWihSuffix(calendar: calendar), "2nd")
        
        // 3rd
        dateComponents.day = 3
        date = calendar.date(from: dateComponents)!
        XCTAssertEqual(date.dayWihSuffix(calendar: calendar), "3rd")
        
        // 4th
        dateComponents.day = 4
        date = calendar.date(from: dateComponents)!
        XCTAssertEqual(date.dayWihSuffix(calendar: calendar), "4th")
        
        // 21st
        dateComponents.day = 21
        date = calendar.date(from: dateComponents)!
        XCTAssertEqual(date.dayWihSuffix(calendar: calendar), "21st")
        
        // 22nd
        dateComponents.day = 22
        date = calendar.date(from: dateComponents)!
        XCTAssertEqual(date.dayWihSuffix(calendar: calendar), "22nd")
        
        // 23rd
        dateComponents.day = 23
        date = calendar.date(from: dateComponents)!
        XCTAssertEqual(date.dayWihSuffix(calendar: calendar), "23rd")
        
        // 31st
        dateComponents.day = 31
        date = calendar.date(from: dateComponents)!
        XCTAssertEqual(date.dayWihSuffix(calendar: calendar), "31st")
    }
}
