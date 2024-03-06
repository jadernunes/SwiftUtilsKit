//
//  JSONEncoder+Extension.swift
//  SwiftUtilsKit
//
//  Created by Jader Nunes on 2024-03-04.
//

import Foundation

public extension JSONEncoder {
    
    static func defaultEncoder(dateFormatter: DateFormatter = .defaultFormatter()) -> JSONEncoder {
        let decoder = JSONEncoder()
        decoder.dateEncodingStrategy = .formatted(dateFormatter)
        return decoder
    }
}
