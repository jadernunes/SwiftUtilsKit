//
//  DateFormatter+Extension.swift
//  SwiftUtilsKit
//
//  Created by Jader Nunes on 2024-03-04.
//

import UIKit

public extension DateFormatter {

    static func defaultFormatter(dateFormat: String = DateFormatType.serverLong.rawValue) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter
    }
}
