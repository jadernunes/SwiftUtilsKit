//
//  Data+Extension.swift
//
//
//  Created by Jader Nunes on 2024-03-05.
//

import Foundation

public extension Data {
    
    func decoded<T: Decodable>(as type: T.Type, using decoder: JSONDecoder = .defaultDecoder()) throws -> T {
        try decoder.decode(type, from: self)
    }
}
