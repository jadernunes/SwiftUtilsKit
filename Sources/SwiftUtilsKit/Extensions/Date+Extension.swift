//
//  Date+Extension.swift
//  
//
//  Created by Jader Nunes on 2024-03-05.
//

import UIKit

public extension Date {

    func day(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.day], from: self).day ?? 0
    }

    func toString(format: String = DateFormatType.serverShort.rawValue,
                  dateFormatter: DateFormatter = .defaultFormatter()) -> String {
        dateFormatter.dateFormat = format
        return  dateFormatter.string(from: self)
    }

    func toFormat(_ format: String = DateFormatType.serverShort.rawValue) -> Date? {
        toString(format: format).toDate(format: format)
    }
    
    /// It returns the ordinal date format, such as 1st, 2nd, and so on.
    ///  - Note: It uses the function: day(calendar: Calendar = .current) -> Int
    /// - Returns: A string with the current day based on the Calendar
    func dayWihSuffix(calendar: Calendar = .current) -> String {
        let day = day(calendar: calendar)
        
        switch day {
        case 1, 21, 31:
            return "\(day)st"
        case 2, 22:
            return "\(day)nd"
        case 3, 23:
            return "\(day)rd"
        default:
            return "\(day)th"
        }
    }
}
