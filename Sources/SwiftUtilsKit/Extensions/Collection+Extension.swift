//
//  Collection+Extension.swift
//  SwiftUtilsKit
//
//  Created by Jader Nunes on 15/10/21.
//

import Foundation

public extension Collection {
    
    var isNotEmpty: Bool { !isEmpty }
    
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
