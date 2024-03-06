//
//  JSONDecoder+Extension.swift
//
//
//  Created by Jader Nunes on 2024-03-05.
//

import Foundation

public extension JSONDecoder {
    
    static func defaultDecoder(dateFormatter: DateFormatter = .defaultFormatter()) -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }
}
