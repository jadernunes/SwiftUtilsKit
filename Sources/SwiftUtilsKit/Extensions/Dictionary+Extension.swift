//
//  Dictionary+Extension.swift
//  SwiftUtilsKit
//
//  Created by Jader Nunes on 15/10/21.
//

import Foundation

extension Dictionary {
    
    /// Remove keys and values where the values are NULL or empty when it's a String
    /// - Returns: the dictionary itself.
    @discardableResult mutating func removeNulls() -> Dictionary {
        keys.forEach { key in
            if let value = self[key],
               let string = value as? String,
               string.isEmpty {
                removeValue(forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
        
        return self
    }
    
    func toData() -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: self)
        } catch {
            return nil
        }
    }
}
