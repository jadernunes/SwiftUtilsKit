//
//  Encodable+Extension.swift
//  SwiftUtilsKit
//
//  Created by Jader Nunes on 15/10/21.
//

import UIKit

public extension Encodable {
    
    func toData(encoder: JSONEncoder = .defaultEncoder()) -> Data? {
        do {
            return try encoder.encode(self)
        } catch {
            return nil
        }
    }
    
    func toJson(encoder: JSONEncoder = .defaultEncoder()) -> [String: Any]? {
        do {
            let jsonData = try encoder.encode(self)
            return try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any]
        } catch {
            return nil
        }
    }
}
