//
//  Dictionary+Extension.swift
//  SwiftUtilsKit
//
//  Created by Jader Nunes on 15/10/21.
//

import Foundation

public extension Dictionary {
    
    func toData() -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: self)
        } catch {
            return nil
        }
    }
}
