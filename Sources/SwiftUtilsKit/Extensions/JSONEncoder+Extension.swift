//
//  JSONEncoder+Extension.swift
//  SwiftUtilsKit
//
//  Created by Jader Nunes on 2024-03-04.
//

import Foundation

public extension JSONEncoder {
    
    static func defaultEncoder(dateFormatter: DateFormatter = .dateFormatter()) -> JSONEncoder {
        let decoder = JSONEncoder()
        decoder.dateEncodingStrategy = .formatted(dateFormatter)
        return decoder
    }
}

public extension JSONDecoder {

    
    static func defaultDecoder(dateFormatter: DateFormatter = .dateFormatter()) -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }
}
